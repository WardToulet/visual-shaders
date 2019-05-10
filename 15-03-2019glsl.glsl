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
    // fragColor.g *= sin(inData.v_texcoord.x * 6 + spectrum.x * 100) / cos(inData.v_texcoord.x * 15);
    // fragColor.g += tan(inData.v_texcoord.y * 12 + spectrum.x * 10);

    fragColor.r += sin(inData.v_texcoord.x * 3000 + spectrum.x * 10) / cos(inData.v_texcoord.x * 15);
    fragColor.r += sin(inData.v_texcoord.x * 30 + spectrum.x * 10) / cos(inData.v_texcoord.x * 60);

    fragColor.r += sin(inData.v_texcoord.y * 30 + spectrum.x * 10) / tan(inData.v_texcoord.y * 5);
    fragColor.r += sin(inData.v_texcoord.y * 30 + spectrum.x * 10) / cos(inData.v_texcoord.y * 30);
    fragColor += vec4(int(sin(inData.v_texcoord.x * 30) < spectrum.x * 10));

    fragColor *= spectrum.x * (1 - int(spectrum.x > .2));
    if(spectrum.x > .2) fragColor *= spectrum.x;
    // fragColor += .5 * texture(code, rotate180(inData.v_texcoord * (1 - spectrum.x) - spectrum.x * 1));
}