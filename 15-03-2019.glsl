#version 150

uniform float time;
uniform vec2 resolution;
uniform vec2 mouse;
uniform vec3 spectrum;
uniform sampler2D img0;
uniform sampler2D img1;

uniform sampler2D vid0;

uniform sampler2D prevFrame;
uniform sampler2D prevPass;
uniform sampler2D code;

uniform sampler2D shared0;

vec2 rotate180(vec2 v) {
    mat2 m = mat2(-1, 0, 0, -1);
	v *= m;
    return vec2(1 + v.x, 1 + v.y);
}

in VertexData
{
    vec4 v_position;
    vec3 v_normal;
    vec2 v_texcoord;
} inData;

out vec4 fragColor;

const int AMOUNT = 10;

void main(void) {
    fragColor += sin(inData.v_texcoord.x * 32);
    fragColor += sin(inData.v_texcoord.y * 18) + spectrum.x * 20;


    fragColor.r -= sin(inData.v_texcoord.x * 16 - spectrum.x * 5);
    fragColor.r -= sin(inData.v_texcoord.y * 9 - spectrum.x * 5);

    fragColor.r += cos(inData.v_texcoord.x * 16 - spectrum.x * 5);
    fragColor.r -= cos(inData.v_texcoord.y * 9 - spectrum.x * 5);
    
    fragColor.g += 1 * sin(inData.v_texcoord.x * 16 * 2 - spectrum.x * 5);
    fragColor.g += 1 * tan(inData.v_texcoord.y * 9 * 2 - spectrum.x * 5);
    
    fragColor *= 10;
    
}