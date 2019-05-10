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

void main(void) {
    float a = tan(inData.v_texcoord.x * 32);
    float b = tan((inData.v_texcoord.y + sin(time * .1)) * (12 + spectrum.x * 2));
    float c = sin(inData.v_texcoord.x * 16 + spectrum.x * 10);
    float d = sin(inData.v_texcoord.y * 16 + spectrum.x * 10);

    fragColor += a + b * (spectrum.x > .2 ? 1 : -1);
    fragColor.b += 10 * spectrum.x * c;
    fragColor.g += 5 * spectrum.x * c;
    
    fragColor.b += 10 * spectrum.x * d;
    fragColor.g += 5 * spectrum.x * d;
    
    fragColor *= a * b;
    if(spectrum.x > .5) fragColor *= -10;
}