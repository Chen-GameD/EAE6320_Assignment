	#version 420
layout( std140, binding = 0 ) uniform g_constantBuffer_frame
{
	mat4 g_transform_worldToCamera;
	mat4 g_transform_cameraToProjected;
	float g_elapsedSecondCount_systemTime;
	float g_elapsedSecondCount_simulationTime;
	vec2 g_padding;
};
out vec4 o_color;
void main()
{
	o_color = vec4(
		1.0, 1.0, 1.0,
		1.0 );
	o_color.r = sin(g_elapsedSecondCount_simulationTime) + 1 / 2;
	o_color.g = sin(g_elapsedSecondCount_simulationTime * 2) + 1 / 2;
	o_color.b = sin(g_elapsedSecondCount_simulationTime * 3) + 1 / 2;
}
