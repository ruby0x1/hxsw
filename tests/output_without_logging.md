Main.hx:76: attempt to load Blit.glsl
Main.hx:40: Blit.Vertex: 
#define is_blit 1
#define HXSW 1
#line 7

in vec4 Position;
void main() {
    gl_Position = Position;
}


Main.hx:41: Blit.Fragment: 
#define is_blit 1
#define HXSW 1
#line 19

uniform sampler2D Sampler;
out vec4 FragColor;
void main() {
    ivec2 coord = ivec2(gl_FragCoord.xy);
    FragColor = texelFetch(Sampler, coord, 0);
}


Main.hx:42: Blit.Fragment.ios: 
precision mediump float;
#define is_blit 1
#define HXSW 1
#line 28

uniform sampler2D tex0;
void main() {
    gl_FragColor = texture2D(tex0, tcoord);
}


Main.hx:76: attempt to load TimeMachine.glsl
Main.hx:60: TimeMachine.Vertex.Grassfire:
Main.hx:65: #define HXSW 1
#version 140
#line 0
FOO

Main.hx:60: TimeMachine.Fragment.Grassfire:
Main.hx:65: #define HXSW 1
#version 140
#line 6
QUX

Main.hx:60: TimeMachine.Fragment.Cilantro:
Main.hx:63: Could not find shader with key TimeMachine.Fragment.Cilantro
Main.hx:60: TimeMachine.Fragment.ios.Grassfire:
Main.hx:65: precision mediump float;
#define HXSW 1
#version 140
#line 8
IOS

Main.hx:76: attempt to load Madrid.glsl
Main.hx:85: cannot open Madrid.glsl / ([file_open,Madrid.glsl])
Main.hx:60: Madrid:
Main.hx:63: Unable to open effect file Madrid.glsl
