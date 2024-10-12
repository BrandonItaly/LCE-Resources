#version 150

#moj_import <fog.glsl>
#moj_import <color_scheme.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }

    if (vertexDistance > 300.0) {
        ivec3 intColor = ivec3(color.rgb * 255.0);

        if (intColor == ivec3(0, 0, 0)) {
            color = vec4(black, 1.0);
        } else if (intColor == ivec3(0, 0, 168)) {
            color = vec4(dark_blue, 1.0);
        } else if (intColor == ivec3(0, 168, 0)) {
            color = vec4(dark_green, 1.0);
        } else if (intColor == ivec3(0, 168, 168)) {
            color = vec4(dark_aqua, 1.0);
        } else if (intColor == ivec3(168, 0, 0)) {
            color = vec4(dark_red, 1.0);
        } else if (intColor == ivec3(168, 0, 168)) {
            color = vec4(dark_purple, 1.0);
        } else if (intColor == ivec3(252, 168, 0)) {
            color = vec4(gold, 1.0);
        } else if (intColor == ivec3(168, 168, 168)) {
            color = vec4(gray, 1.0);
        } else if (intColor == ivec3(64, 64, 64)) {
            color = vec4(gray, 1.0);
        } else if (intColor == ivec3(84, 84, 84)) {
            color = vec4(dark_gray, 1.0);
        } else if (intColor == ivec3(84, 84, 252)) {
            color = vec4(blue, 1.0);
        } else if (intColor == ivec3(84, 252, 84)) {
            color = vec4(green, 1.0);
        } else if (intColor == ivec3(84, 252, 252)) {
            color = vec4(aqua, 1.0);
        } else if (intColor == ivec3(252, 84, 84)) {
            color = vec4(red, 1.0);
        } else if (intColor == ivec3(252, 84, 252)) {
            color = vec4(light_purple, 1.0);
        } else if (intColor == ivec3(252, 252, 84)) {
            color = vec4(yellow, 1.0);
        } else if (intColor == ivec3(252, 252, 252)) {
            color = vec4(white, 1.0);
        } else if (color.r > 0.2479 && color.r < 0.2481 && color.g > 0.2479 && color.g < 0.2481 && color.b > 0.2479 && color.b < 0.2481) {
            color = vec4(title_text_color, 1.0);
        } else if (intColor == ivec3(79, 0, 79)) {
            color = vec4(body_text_color, 1.0);
        } else if (intColor == ivec3(221, 221, 221)) {
            color = vec4(beacon_power_title_text_color, 1.0);
        }
    }
	
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
