/**
 * Screen Space Ambient Occlusion
 * by Ethatron and Marty McFly
 *
 * Ported from ReShade Framework
 * to ReShade 3.0+ by mbah.primbon
 *
 */

//------------------- Non GUI Settings -------------------
#define AO_BLUR_STEPS    11        //Offset count for AO smoothening. Higher means more smooth AO but also blurrier AO.
#define AO_SHARPNESS     0.8       //AO sharpness, higher means more sharp geometry edges but noisier AO, less means smoother AO but blurry in the distance.


//-------------------- GUI Settings ----------------------
uniform bool bSSAODebug <
	ui_label = "SSAO Debug View";
	ui_tooltip = "Enables raw AO/IL output for debugging and tuning purposes.";
> = false;

uniform float fSSAOScale <
	ui_type = "drag";
	ui_min = 0.25; ui_max = 1.00;
    ui_label = "SSAO Scale";
	ui_tooltip = "Scale of AO resolution. Lower resolution means less pixels to process and more performance but also less quality.";
> = 1.00;

uniform float fSSAOFadeStart <
	ui_type = "drag";
	ui_min = 0.00; ui_max = 1.00; ui_step = 0.01;
    ui_label = "SSAO Fade Start";
	ui_tooltip = "Distance from camera where AO starts to fade out. 0.0 means camera itself, 1.0 means infinite distance.";
> = 0.40;

uniform float fSSAOFadeEnd <
	ui_type = "drag";
	ui_min = 0.00; ui_max = 1.00; ui_step = 0.01;
    ui_label = "SSAO Fade End";
	ui_tooltip = "Distance from camera where AO fades out completely. 0.0 means camera itself, 1.0 means infinite distance.";
> = 0.90;

uniform int iSSAOSamples <
	ui_type = "drag";
	ui_min = 16; ui_max = 128;
    ui_label = "SSAO Samples";
	ui_tooltip = "Amount of samples. Don't set too high or shader compilation time goes through the roof.";
> = 16;

uniform float fSSAOSamplingRange <
	ui_type = "drag";
	ui_min = 5.00; ui_max = 50.00; ui_step = 0.01;
    ui_label = "SSAO Sampling Range";
	ui_tooltip = "SSAO sampling range. High range values might need more samples so raise both.";
> = 25;

uniform float fSSAODarkeningAmount <
	ui_type = "drag";
	ui_min = 0.00; ui_max = 5.00; ui_step = 0.01;
    ui_label = "SSAO Darkening Amount";
	ui_tooltip = "Amount of SSAO corner darkening";
> = 1.50;

uniform float fSSAOBrighteningAmount <
	ui_type = "drag";
	ui_min = 0.00; ui_max = 5.00; ui_step = 0.01;
    ui_label = "SSAO Darkening Amount";
	ui_tooltip = "Amount of SSAO edge brightening";
> = 1.00;
//------------------------------------------------------------------------
#include "ReShade.fxh"

// Textures and samplers
texture texNoise <source = "noise.png";> {Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA8;};
texture texSSAO1 { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT;  Format = RGBA16F;};
texture texSSAO2 { Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT;  Format = RGBA16F;};
sampler SamplerSSAO1 {Texture = texSSAO1;};
sampler SamplerSSAO2 {Texture = texSSAO2;};
sampler SamplerNoise {Texture = texNoise; MinFilter = LINEAR; MagFilter = LINEAR; MipFilter = LINEAR; AddressU = Wrap; AddressV = Wrap;};

// Pixel shaders
void PS_AO_SSAO(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 Occlusion1R : SV_Target)
{
	texcoord.xy /= fSSAOScale;
	if(texcoord.x > 1.0 || texcoord.y > 1.0) discard;

	//global variables
	float fSceneDepthP 	= ReShade::GetLinearizedDepth(texcoord.xy).x;
	float blurkey = fSceneDepthP;

	if(fSceneDepthP > min(0.9999,fSSAOFadeEnd)) Occlusion1R = float4(0.5,0.5,0.5,blurkey);
	else {
		float offsetScale = fSSAOSamplingRange/10000;
		float fSSAODepthClip = 10000000.0;

		float3 vRotation = tex2Dlod(SamplerNoise, float4(texcoord.xy, 0, 0)).rgb - 0.5f;
	
		float3x3 matRotate;

		float hao = 1.0f / (1.0f + vRotation.z);

		matRotate._m00 =  hao * vRotation.y * vRotation.y + vRotation.z;
		matRotate._m01 = -hao * vRotation.y * vRotation.x;
		matRotate._m02 = -vRotation.x;
		matRotate._m10 = -hao * vRotation.y * vRotation.x;
		matRotate._m11 =  hao * vRotation.x * vRotation.x + vRotation.z;
		matRotate._m12 = -vRotation.y;
		matRotate._m20 =  vRotation.x;
		matRotate._m21 =  vRotation.y;
		matRotate._m22 =  vRotation.z;

		float fOffsetScaleStep = 1.0f + 2.4f / iSSAOSamples;
		float fAccessibility = 0;

		int Sample_Scaled = iSSAOSamples;

		#if(SSAO_SmartSampling==1)
			if(fSceneDepthP > 0.5) Sample_Scaled=max(8,round(Sample_Scaled*0.5));
			if(fSceneDepthP > 0.8) Sample_Scaled=max(8,round(Sample_Scaled*0.5));
		#endif

		float fAtten = 5000.0/fSSAOSamplingRange/(1.0+fSceneDepthP*10.0);
	
		[loop]
		for (int i = 0 ; i < (Sample_Scaled / 8) ; i++)
		for (int x = -1 ; x <= 1 ; x += 2)
		for (int y = -1 ; y <= 1 ; y += 2)
		for (int z = -1 ; z <= 1 ; z += 2) {
			//Create offset vector
			float3 vOffset = normalize(float3(x, y, z)) * (offsetScale *= fOffsetScaleStep);
			//Rotate the offset vector
			float3 vRotatedOffset = mul(vOffset, matRotate);

			//Center pixel's coordinates in screen space
			float3 vSamplePos = float3(texcoord.xy, fSceneDepthP);
 
			//Offset sample point
			vSamplePos += float3(vRotatedOffset.xy, vRotatedOffset.z * fSceneDepthP);

			//Read sample point depth
			float fSceneDepthS = ReShade::GetLinearizedDepth(vSamplePos.xy).x;

			//Discard if depth equals max
			if (fSceneDepthS >= fSSAODepthClip)
			fAccessibility += 1.0f;
			else {
				//Compute accessibility factor
				float fDepthDist = abs(fSceneDepthP - fSceneDepthS);
				float fRangeIsInvalid = saturate(fDepthDist*fAtten);
				fAccessibility += lerp(fSceneDepthS > vSamplePos.z, 0.5f, fRangeIsInvalid);
			}
		}
 
		//Compute average accessibility
		fAccessibility = fAccessibility / Sample_Scaled;
	
		Occlusion1R = float4(fAccessibility.xxx,blurkey);
	}
}

void PS_AO_AOBlurV(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 Occlusion2R : SV_Target)
{
	//It's better to do this here, upscaling must produce artifacts and upscale-> blur is better than blur -> upscale
	//besides: code is easier an I'm very lazy :P
	texcoord.xy *= fSSAOScale;
	float  sum,totalweight=0;
	float4 base = tex2D(SamplerSSAO1, texcoord.xy), temp=0;
	
	[loop]
	for (int r = -AO_BLUR_STEPS; r <= AO_BLUR_STEPS; ++r) 
	{
		float2 axis = float2(0.0, 1.0);
		temp = tex2D(SamplerSSAO1, texcoord.xy + axis * ReShade::PixelSize * r);
		float weight = AO_BLUR_STEPS-abs(r); 
		weight *= max(0.0, 1.0 - (1000.0 * AO_SHARPNESS) * abs(temp.w - base.w));
		sum += temp.x * weight;
		totalweight += weight;
	}

	Occlusion2R = float4(sum / (totalweight+0.0001),0,0,base.w);
}

void PS_AO_AOBlurH(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 Occlusion1R : SV_Target)
{
	float  sum,totalweight=0;
	float4 base = tex2D(SamplerSSAO2, texcoord.xy), temp=0;
	
	[loop]
	for (int r = -AO_BLUR_STEPS; r <= AO_BLUR_STEPS; ++r) 
	{
		float2 axis = float2(1.0, 0.0);
		temp = tex2D(SamplerSSAO2, texcoord.xy + axis * ReShade::PixelSize * r);
		float weight = AO_BLUR_STEPS-abs(r); 
		weight *= max(0.0, 1.0 - (1000.0 * AO_SHARPNESS) * abs(temp.w - base.w));
		sum += temp.x * weight;
		totalweight += weight;
	}

	Occlusion1R = float4(sum / (totalweight+0.0001),0,0,base.w);
}

float4 PS_AO_AOCombine(float4 vpos : SV_Position, float2 texcoord : TEXCOORD) : SV_Target 
{
	float4 color = tex2D(ReShade::BackBuffer, texcoord.xy);
	float ao = tex2D(SamplerSSAO1, texcoord.xy).x;

	ao -= 0.5;
	if(ao < 0) ao *= fSSAODarkeningAmount;
	if(ao > 0) ao *= fSSAOBrighteningAmount;
	ao = 2 * saturate(ao+0.5);
	
	if(bSSAODebug)
	{	 
		ao *= 0.75;
		float depth = ReShade::GetLinearizedDepth(texcoord.xy).x;
		ao = lerp(ao,1.0,smoothstep(fSSAOFadeStart,fSSAOFadeEnd,depth));
		return ao;
	}
	else
	{
		float depth = ReShade::GetLinearizedDepth(texcoord.xy).x;
		ao = lerp(ao,1.0,smoothstep(fSSAOFadeStart,fSSAOFadeEnd,depth));

		color.xyz *= ao;
		return color;
	}
}

// Rendering passes
technique SSAO
{
	pass SSAmbientOcclusion
	{
		VertexShader = PostProcessVS;
		PixelShader = PS_AO_SSAO;
		RenderTarget = texSSAO1;
	}
	
	pass BlurV
	{
		VertexShader = PostProcessVS;
		PixelShader = PS_AO_AOBlurV;
		RenderTarget = texSSAO2;
	}
	
	pass BlurH
	{
		VertexShader = PostProcessVS;
		PixelShader = PS_AO_AOBlurH;
		RenderTarget = texSSAO1;
	}
	
	pass Combine
	{
		VertexShader = PostProcessVS;
		PixelShader = PS_AO_AOCombine;
	}
	
}