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
    float a = tan(inData.v_texcoord.x * 10 + spectrum.x * 1) * tan(inData.v_texcoord.y * -5 * spectrum.x + inData.v_texcoord.x * 5 - spectrum.x * 160);
    float b = tan(inData.v_texcoord.y * 8 + sin(time) * 4);
    float c = tan(inData.v_texcoord.y - sin(spectrum.x * 30 + time));
    // float c = 1;
    
    fragColor = vec4(a * b * c);
    //fragColor *= 10;

    fragColor.r *= a / b / c;
    fragColor *= a * b * c;
    fragColor.r *=  a * b * c;

    fragColor *= (spectrum.x > .4 ? -1: 1);
}