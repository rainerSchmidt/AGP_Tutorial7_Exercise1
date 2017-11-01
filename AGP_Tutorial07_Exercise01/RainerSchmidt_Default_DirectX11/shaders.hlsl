struct VOut
{
	float4 position : SV_POSITION;
	float4 color : COLOR;
};

cbuffer CBuffer0
{
	matrix WVPMatrix; // 64 bytes
	float threeColor_fraction; // 4 bytes
	float scale;    // 4 bytes
	float2 packing; // 2x4 bytes = 8 bytes
	// total 80 bytes
};

VOut VShader(float4 position : POSITION, float4 color : COLOR)
{
	VOut output;

	//color.g *= threeColor_fraction;
	output.position = mul(WVPMatrix, position);
	//output.position = position;
	output.color = color;

	return output;
}

float4 PShader(float4 position : SV_POSITION, float4 color : COLOR) : SV_TARGET
{
	return color;
}