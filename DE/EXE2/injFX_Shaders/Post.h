/*======================================================================================
                             POST FXAA RENDERING PASSES
======================================================================================*/

#if (FXAA_HLSL_4 == 1 || FXAA_HLSL_5 == 1)
#define tex2D(s,p) gScreenTexture.SampleLevel(s,p,0)
#define s0 screenSampler
#define width BUFFER_WIDTH
#define height BUFFER_HEIGHT
#define px BUFFER_RCP_WIDTH
#define py BUFFER_RCP_HEIGHT
#define dx ((AverageBlur * 0.05)*px)
#define dy ((AverageBlur * 0.05)*py)
#else
#define s0 lumaSampler
#define width BUFFER_WIDTH
#define height BUFFER_HEIGHT
#define px BUFFER_RCP_WIDTH
#define py BUFFER_RCP_HEIGHT
#define dx ((AverageBlur * 0.05)*px)
#define dy ((AverageBlur * 0.05)*py)
#endif
/*------------------------------------------------------------------------------
						FILTER TO USE CHECK
------------------------------------------------------------------------------*/
#if (USE_CUSTOM == 1)
#include "injFX_Shaders\CustomShader.h"
#endif
#if (USE_PRE_SHARPEN == 1)
#include "injFX_Shaders\PreSharpen.h"
#endif
#if (USE_HDR == 1)
#include "injFX_Shaders\HDR.h"
#endif
#if (USE_BLOOM == 1)
#include "injFX_Shaders\Bloom.h"
#endif
#if (USE_TONEMAP == 1)
#include "injFX_Shaders\Tonemap.h"
#endif
#if (USE_TECHNICOLOR == 1)
#include "injFX_Shaders\Technicolor.h"
#endif
#if (USE_SEPIA == 1)
#include "injFX_Shaders\Sepia.h"
#endif
#if (USE_NOISE == 1)
#include "injFX_Shaders\Noise.h"
#endif
#if (USE_RADIAL == 1)
#include "injFX_Shaders\Radial.h"
#endif
#if (USE_SCANLINES == 1)
#include "injFX_Shaders\ScanLines.h"
#endif
#if (USE_ANAGLYPH == 1)
#include "injFX_Shaders\Anaglyph.h"
#endif
#if (USE_VIGNETTE == 1)
#include "injFX_Shaders\Vignette.h"
#endif
#if (USE_POST_SHARPEN == 1)
#include "injFX_Shaders\PostSharpen.h"
#endif
#if (USE_FINAL_LIMITER == 1)
#include "injFX_Shaders\FinalLimiter.h"
#endif
#if (USE_SPLITSCREEN == 1)
#include "injFX_Shaders\SplitScreen.h"
#endif
/*------------------------------------------------------------------------------
						RENDERING PASSES
------------------------------------------------------------------------------*/
float4 main( float2 tex)
{
	// PreSharpenPass (has to be the first pass because it samples multiple texels)
	#if (USE_PRE_SHARPEN == 1)
		float4 pass1 = SharpenPass(tex);
	#else
		float4 pass1 = tex2D(s0,tex);
	#endif
	// Shader1
	#if (Check1 == 1)
		float4 pass2 = Shader1(pass1,tex);
	#else
		float4 pass2 = pass1;
	#endif
	// Shader2
	#if (Check2 == 1)
		float4 pass3 = Shader2(pass2,tex);
	#else
		float4 pass3 = pass2;
	#endif
	// Shader3
	#if (Check3 == 1)
		float4 pass4 = Shader3(pass3, tex);
	#else
		float4 pass4 = pass3;
	#endif
	// Shader4
	#if (Check4 == 1)
		float4 pass5 = Shader4(pass4, tex);
	#else
		float4 pass5 = pass4;
	#endif
	// Shader5
	#if (Check5 == 1)
		float4 pass6 = Shader5(pass5,tex);
	#else
		float4 pass6 = pass5;
	#endif
	// Shader6
	#if (Check6 == 1)
		float4 pass7 = Shader6(pass6,tex);
	#else
		float4 pass7 = pass6;
	#endif	
	// Shader7
	#if (Check7 == 1)
		float4 pass8 = Shader7(pass7,tex);
	#else
		float4 pass8 = pass7;
	#endif	
	// Shader8
	#if (Check8 == 1)
		float4 pass9 = Shader8(pass8,tex);
	#else
		float4 pass9 = pass8;
	#endif	
	// Shader9
	#if (Check9 == 1)
		float4 pass10 = Shader9(pass9,tex);
	#else
		float4 pass10 = pass9;
	#endif
	//VignettePass
	#if (USE_VIGNETTE == 1)
		float4 pass11 = VignettePass(pass10, tex);
	#else
		float4 pass11 = pass10;
	#endif
	// AnaglyphPass
	#if (USE_ANAGLYPH == 1)
		float4 pass12 = AnaglyphPass(pass11,tex);
	#else
		float4 pass12 = pass11;
	#endif
	// PostSharpenPass
	#if (USE_POST_SHARPEN == 1)
		float4 pass13 = PostSharpenPass (pass12,tex);
	#else
		float4 pass13 = pass12;
	#endif
	// FinalLimiterPass (always last shader)
	#if (USE_FINAL_LIMITER == 1)
		float4 pass14 = limiter (pass13,tex);
	#else
		float4 pass14 = pass13;
	#endif
	// SplitScreenPass (after all shaders)
	#if (USE_SPLITSCREEN == 1)
		float4 pass15 = SplitScreenPass(pass14,tex);
	#else
		float4 pass15 = pass14;
	#endif
	return pass15;
}