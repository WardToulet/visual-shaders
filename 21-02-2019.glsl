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

    fragColor.g = int(sin(inData.v_texcoord.x * inData.v_texcoord.y * 20) * 200 * spectrum.x);

    fragColor *= 0.1 * vec4(sin(sin(inData.v_texcoord.y * 20) * 10 * spectrum.x));
    fragColor += 0.1 * vec4(sin(sin(inData.v_texcoord.y * 400) * 20 * spectrum.x));

    fragColor *= sin(inData.v_texcoord.x * 16 + spectrum.x + time * (int(inData.v_texcoord.y * 100000 + sin(time) - spectrum.x * 20) % 2 == 0 ? 1 : -1));

    fragColor *= sin(inData.v_texcoord.y * 16 + spectrum.x + time * (int(inData.v_texcoord.y * 100000 + sin(time) - spectrum.x * 20) % 2 == 0 ? 1 : -1));

    fragColor.b += tan(inData.v_texcoord.x * 100 * spectrum.x / inData.v_texcoord.y * 100 * spectrum.x) * spectrum.x * 40;
    fragColor.r += tan((1 - inData.v_texcoord.x) * 10 * spectrum.x / (1 - inData.v_texcoord.y) * 10 * spectrum.x) * spectrum.x * 40;


    fragColor += texture(code, rotate180(inData.v_texcoord + spectrum.x)) * 20;

    if(spectrum.x > 0.2) fragColor = 100 * texture(prevFrame, rotate180(inData.v_texcoord));
}