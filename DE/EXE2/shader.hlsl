/*------------------------------------------------------------------------------
						FXAA SHADER
------------------------------------------------------------------------------*/

// Includes the user settings
#include "injFX_Settings\injFXaaSettings.h"
// Defines the API to use it with
#define FXAA_HLSL_4 1
// Includes the Main shader, FXAA 3.11
#include "injFX_Shaders\Fxaa3_11.h"

Texture2D	gScreenTexture : register( t0 );
Texture2D	gLumaTexture : register(t1);
SamplerState screenSampler : register(s0);

//Difinitions: BUFFER_WIDTH, BUFFER_HEIGHT, BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT
float2 Tex : TEXCOORD0;

struct PS_INPUT
{
	float2 vTexcoord	: TEXCOORD0;
};
struct VS_Output
{
    float4 Pos : SV_POSITION;
    float2 Tex : TEXCOORD0;
};
struct VS_Input
{
    float4 Pos : POSITION;
    float2 Tex : TEXCOORD0;
};

VS_Output VSMain( VS_Input Input )
{
	VS_Output Output;
    Output.Pos = Input.Pos;
	Output.Tex = Input.Tex;
	return Output;
};

// Includes additional shaders, like Sharpen, Bloom, Tonemap etc.
#include "injFX_Shaders\Post.h"

// FXAA Shader Function
float4 LumaShader( VS_Output Input ) : SV_TARGET
{	
#if(USE_ANTI_ALIASING == 1)
	FxaaTex screenSampler2 = { screenSampler, gLumaTexture };
	float4 c0 = FxaaPixelShader(
		// pos, Output color texture
		Input.Tex,
		// tex, Input color texture
		screenSampler2,
		// fxaaQualityRcpFrame, gets coordinates for screen width and height, xy
		float2(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT),
		//fxaaConsoleRcpFrameOpt2, gets coordinates for screen width and height, xyzw
		float4(-2.0*BUFFER_RCP_WIDTH,-2.0*BUFFER_RCP_HEIGHT,2.0*BUFFER_RCP_WIDTH,2.0*BUFFER_RCP_HEIGHT),
		// Choose the amount of sub-pixel aliasing removal
		fxaaQualitySubpix,
		// The minimum amount of local contrast required to apply algorithm
		fxaaQualityEdgeThreshold,
		// Trims the algorithm from processing darks
		fxaaQualityEdgeThresholdMin
	);
	c0.w = 1;
	#else
	float4 c0 = tex2D(screenSampler,Tex);
	#endif
    return c0;
}

float4 MyShader( VS_Output Input ) : SV_TARGET
{
	float4 c0 = main(Input.Tex);
	c0.w = 1;
    return saturate(c0);
}

technique PostProcess1
{
    pass p1
    {
		SetPixelShader(CompileShader(ps_5_0, VSMain()));
    }
}
technique PostProcess2
{
    pass p1
    {
		SetPixelShader(CompileShader(ps_5_0, VSMain()));
    }
}
