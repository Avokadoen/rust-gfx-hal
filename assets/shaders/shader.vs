#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(push_constant) uniform PushConstants {
    vec2 viewport; // unused push constant as we need push constant for later we keep it
} push_constants;

void main() {
    vec2 position;

    // For now we can hard code our vertext data as we only care about 1 layer of pixels for texture surface
    // Branching in this case should be ok because its 6 each frame + branch time should be the same no matter branch outcome
    switch (gl_VertexIndex) {
        case 0:
            position = vec2(-1, -1);
            break;
        case 1:
            position = vec2(-1, 1);
            break;
        case 2:
            position = vec2(1, 1);
            break;
        case 3:
            position = vec2(-1, -1);
            break;
        case 4:
            position = vec2(1, 1);
            break;
        case 5:
            position = vec2(1, -1);
            break;
    }
    
    gl_Position = vec4((position), 0.0, 1.0);
}