#define USE_CUSTOM 1
#define USE_CUSTOM_SELECT 1
#define USE_ANTI_ALIASING 1
#define USE_PRE_SHARPEN 1
#define USE_BLOOM 0
#define USE_HDR 0
#define USE_TECHNICOLOR 0
#define USE_TONEMAP 0
#define USE_SEPIA 0
#define USE_NOISE 0
#define USE_RADIAL 0
#define USE_SCANLINES 0
#define USE_ANAGLYPH 0
#define USE_VIGNETTE 0
#define USE_POST_SHARPEN 0
#define USE_FINAL_LIMITER 0
#define USE_SPLITSCREEN 0
#define FXAA_QUALITY__PRESET 1
float fxaaQualitySubpix = 0.0777;
float fxaaQualityEdgeThreshold = 0.3133;
float fxaaQualityEdgeThresholdMin = 0.0801;
bool highQualitySharpen = 0;
float Sharpen = 0.014;
float AverageBlur = 0.05;
float CoefficientsBlur = 1.3333;
float CoefficientsOriginal = 2.3333;
float SharpenEdge = 0.205;
float SharpenContour = 0.055;
float BloomThreshold = 17.625;
float BloomPower = 2.115;
float BloomWidth = 0.0355;
float HDRPower = 1;
float radius2 = 0.831;
#define TechniAmount 0.11
#define TechniPower 2.4
#define redNegativeAmount 0.99
#define greenNegativeAmount 0.99
#define blueNegativeAmount 0.99
#define Gamma 1.05
#define Exposure 0
#define Saturation 0
#define Bleach 0.5
#define Defog 0
#define FogColor float4(2.54, 2.53, 2.26, 2.55)
#define BlueShift 0
#define ColorTone float3(1.47, 0.39, 0.36)
float SepiaPower = 0.11;
float GreyPower = 0.11;
#define NoiseStrength 0.101
#define NoiseIntensity 0.11
#define LineIntensity 0.11
#define LineAmount 512
#define NoiseMode 1
#define RadialStrength 0.15
#define RadialWidth -0.05
#define ScanLineWidth 1
#define ScanLineColor 1
#define ScanLinePower 0.01
float AnaglyphSeperation = 0.0015;
float AnaglyphRed = 0;
float AnaglyphGreen = 0;
float AnaglyphBlue = 0;
#define VignetteRadius 0.985
#define VignetteAmount -2
#define VignetteStrength 0.05
float4 LimiterMinColor= float4(0.01,0.01,0.01,0.0f);
float4 LimiterMaxColor= float4(0.99,0.99,0.99,1.0f);
#define SplitScreenMode 1
#define Check1 USE_BLOOM
#define Shader1 BloomPass
#define Check2 USE_HDR
#define Shader2 HDRPass
#define Check3 USE_TONEMAP
#define Shader3 TonemapPass
#define Check4 USE_SEPIA
#define Shader4 SepiaPass
#define Check5 USE_TECHNICOLOR
#define Shader5 TechnicolorPass
#define Check6 USE_NOISE
#define Shader6 NoisePass
#define Check7 USE_RADIAL
#define Shader7 RadialPass
#define Check8 USE_SCANLINES
#define Shader8 ScanlinePass
#define Check9 USE_CUSTOM
#define Shader9 CustomPass
#define CustomValue1 5
#define CustomValue2 5
#define CustomValue3 5
#define CustomValue4 5
#define CustomValue5 5
#define CustomValue6 5

