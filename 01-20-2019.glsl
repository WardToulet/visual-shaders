// fragColor += texture(vid0, rotate180(inData.v_texcoord));

// fragColor *= vec4(0, 1, 0, 1);

// fragColor += vec4(tan(inData.v_texcoord.x * 40 + 5 * spectrum.x));
// fragColor += vec4(tan(inData.v_texcoord.y * 20 + 10 * spectrum.x));

// fragColor -= vec4(sin((inData.v_texcoord.y + time * .01) * 10 + spectrum.x * 5));
// fragColor += vec4(cos(inData.v_texcoord.x * 40), spectrum.x * 5,tan(inData.v_texcoord.y), 1);

// if(spectrum.x > .3) {
//     fragColor *= -1;
//     fragColor += 1 - vec4(spectrum.x   * 50);
// }
// fragColor += texture(code, rotate180(inData.v_texcoord));

// fragColor = texture(prevFrame, inData.v_texcoord);