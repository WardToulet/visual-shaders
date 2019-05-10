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
    fragColor = vec4(spectrum.x * .7);

    fragColor.r += sin((inData.v_texcoord.x + spectrum.x * 10) * 30) * inData.v_texcoord.x * 30 * spectrum.x;
    fragColor.r += tan(inData.v_texcoord.y * 30) * inData.v_texcoord.x * 30 * spectrum.x;

    fragColor.r *= sin(inData.v_texcoord.x * 30 * (1 - spectrum.x));

    fragColor += texture(code, rotate180(vec2(inData.v_texcoord.x + spectrum.x * .2, inData.v_texcoord.y)));
    
    fragColor *= (spectrum.x > .8 ? 0 : 1);
}   