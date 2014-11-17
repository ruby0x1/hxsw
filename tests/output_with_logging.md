HXSW.hx:381: hxsw / request shader from Blit
HXSW.hx:381: hxsw / already loaded? false
HXSW.hx:381: hxsw / loading from file Blit.glsl
Main.hx:76: attempt to load Blit.glsl
HXSW.hx:381: hxsw / line -------- Vertex --------
HXSW.hx:381: hxsw / alpha sequence found as `Vertex`
HXSW.hx:381: hxsw / reached new block, existing block open? false
HXSW.hx:381: hxsw / shaderkey was ``
HXSW.hx:381: hxsw / at line 7, effect shader key `Vertex`
HXSW.hx:381: hxsw / switched context to Blit.Vertex
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw / prepend directive due to effect token `Blit` #define is_blit 1
HXSW.hx:381: hxsw /	 8: 
HXSW.hx:381: hxsw /	 9: in vec4 Position;
HXSW.hx:381: hxsw /	 10: void main() {
HXSW.hx:381: hxsw /	 11:     gl_Position = Position;
HXSW.hx:381: hxsw /	 12: }
HXSW.hx:381: hxsw /	 13: 
HXSW.hx:381: hxsw / line --- /\/\/\/\/\/\/\/\ ---
HXSW.hx:381: hxsw / store Blit.Vertex with `105` size
HXSW.hx:381: hxsw / skipping section until next block
HXSW.hx:381: hxsw / line --[[[[[ Fragment <== Brigadier Lethbridge-Stewart
HXSW.hx:381: hxsw / alpha sequence found as `Fragment`
HXSW.hx:381: hxsw / reached new block, existing block open? false
HXSW.hx:381: hxsw / shaderkey was ``
HXSW.hx:381: hxsw / at line 19, effect shader key `Fragment`
HXSW.hx:381: hxsw / switched context to Blit.Fragment
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw / prepend directive due to effect token `Blit` #define is_blit 1
HXSW.hx:381: hxsw /	 20: 
HXSW.hx:381: hxsw /	 21: uniform sampler2D Sampler;
HXSW.hx:381: hxsw /	 22: out vec4 FragColor;
HXSW.hx:381: hxsw /	 23: void main() {
HXSW.hx:381: hxsw /	 24:     ivec2 coord = ivec2(gl_FragCoord.xy);
HXSW.hx:381: hxsw /	 25:     FragColor = texelFetch(Sampler, coord, 0);
HXSW.hx:381: hxsw /	 26: }
HXSW.hx:381: hxsw /	 27: 
HXSW.hx:381: hxsw / line -- Fragment.ios
HXSW.hx:381: hxsw / alpha sequence found as `Fragment.ios`
HXSW.hx:381: hxsw / reached new block, existing block open? true
HXSW.hx:381: hxsw / shaderkey was `Fragment`
HXSW.hx:381: hxsw / store Blit.Fragment with `196` size
HXSW.hx:381: hxsw / at line 28, effect shader key `Fragment.ios`
HXSW.hx:381: hxsw / switched context to Blit.Fragment.ios
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw / prepend directive due to effect token `Blit` #define is_blit 1
HXSW.hx:381: hxsw / prepend directive due to ios: precision mediump float;
HXSW.hx:381: hxsw /	 29: 
HXSW.hx:381: hxsw /	 30: uniform sampler2D tex0;
HXSW.hx:381: hxsw /	 31: void main() {
HXSW.hx:381: hxsw /	 32:     gl_FragColor = texture2D(tex0, tcoord);
HXSW.hx:381: hxsw /	 33: }
HXSW.hx:381: hxsw /	 34: 
HXSW.hx:381: hxsw / store Blit.Fragment.ios with `153` size
HXSW.hx:381: hxsw / finding match for Blit.Vertex...
HXSW.hx:381: hxsw / 	 check:`Blit.Vertex` ... 
HXSW.hx:381: hxsw / 	 match> closest set to `Blit.Vertex`
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment.ios` ... 
HXSW.hx:381: hxsw / closestkey found as `Blit.Vertex`
HXSW.hx:381: hxsw / request shader from Blit
HXSW.hx:381: hxsw / already loaded? true
HXSW.hx:381: hxsw / finding match for Blit.Fragment...
HXSW.hx:381: hxsw / 	 check:`Blit.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment` ... 
HXSW.hx:381: hxsw / 	 match> closest set to `Blit.Fragment`
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment.ios` ... 
HXSW.hx:381: hxsw / closestkey found as `Blit.Fragment`
HXSW.hx:381: hxsw / request shader from Blit
HXSW.hx:381: hxsw / already loaded? true
HXSW.hx:381: hxsw / finding match for Blit.Fragment.ios...
HXSW.hx:381: hxsw / 	 check:`Blit.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment` ... 
HXSW.hx:381: hxsw / 	 match> closest set to `Blit.Fragment`
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment.ios` ... 
HXSW.hx:381: hxsw / 	 match> closest set to `Blit.Fragment.ios`
HXSW.hx:381: hxsw / closestkey found as `Blit.Fragment.ios`
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


HXSW.hx:381: hxsw / request shader from TimeMachine
HXSW.hx:381: hxsw / already loaded? false
HXSW.hx:381: hxsw / loading from file TimeMachine.glsl
Main.hx:76: attempt to load TimeMachine.glsl
HXSW.hx:381: hxsw / line -- Vertex
HXSW.hx:381: hxsw / alpha sequence found as `Vertex`
HXSW.hx:381: hxsw / reached new block, existing block open? false
HXSW.hx:381: hxsw / shaderkey was ``
HXSW.hx:381: hxsw / at line 0, effect shader key `Vertex`
HXSW.hx:381: hxsw / switched context to TimeMachine.Vertex
HXSW.hx:381: hxsw / prepend directive due to effect token `TimeMachine` #version 140
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw /	 1: FOO
HXSW.hx:381: hxsw / line -- Geometry
HXSW.hx:381: hxsw / alpha sequence found as `Geometry`
HXSW.hx:381: hxsw / reached new block, existing block open? true
HXSW.hx:381: hxsw / shaderkey was `Vertex`
HXSW.hx:381: hxsw / store TimeMachine.Vertex with `40` size
HXSW.hx:381: hxsw / at line 2, effect shader key `Geometry`
HXSW.hx:381: hxsw / switched context to TimeMachine.Geometry
HXSW.hx:381: hxsw / prepend directive due to effect token `TimeMachine` #version 140
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw /	 3: BAR
HXSW.hx:381: hxsw / line -- Fragment.Erosion
HXSW.hx:381: hxsw / alpha sequence found as `Fragment.Erosion`
HXSW.hx:381: hxsw / reached new block, existing block open? true
HXSW.hx:381: hxsw / shaderkey was `Geometry`
HXSW.hx:381: hxsw / store TimeMachine.Geometry with `40` size
HXSW.hx:381: hxsw / at line 4, effect shader key `Fragment.Erosion`
HXSW.hx:381: hxsw / switched context to TimeMachine.Fragment.Erosion
HXSW.hx:381: hxsw / prepend directive due to effect token `TimeMachine` #version 140
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw /	 5: BAZ
HXSW.hx:381: hxsw / line -- Fragment.Grassfire
HXSW.hx:381: hxsw / alpha sequence found as `Fragment.Grassfire`
HXSW.hx:381: hxsw / reached new block, existing block open? true
HXSW.hx:381: hxsw / shaderkey was `Fragment.Erosion`
HXSW.hx:381: hxsw / store TimeMachine.Fragment.Erosion with `40` size
HXSW.hx:381: hxsw / at line 6, effect shader key `Fragment.Grassfire`
HXSW.hx:381: hxsw / switched context to TimeMachine.Fragment.Grassfire
HXSW.hx:381: hxsw / prepend directive due to effect token `TimeMachine` #version 140
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw /	 7: QUX
HXSW.hx:381: hxsw / line -- Fragment.ios.Grassfire
HXSW.hx:381: hxsw / alpha sequence found as `Fragment.ios.Grassfire`
HXSW.hx:381: hxsw / reached new block, existing block open? true
HXSW.hx:381: hxsw / shaderkey was `Fragment.Grassfire`
HXSW.hx:381: hxsw / store TimeMachine.Fragment.Grassfire with `40` size
HXSW.hx:381: hxsw / at line 8, effect shader key `Fragment.ios.Grassfire`
HXSW.hx:381: hxsw / switched context to TimeMachine.Fragment.ios.Grassfire
HXSW.hx:381: hxsw / prepend directive due to effect token `TimeMachine` #version 140
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw / prepend directive due to ios: precision mediump float;
HXSW.hx:381: hxsw /	 9: IOS
HXSW.hx:381: hxsw / line -- TessControl
HXSW.hx:381: hxsw / alpha sequence found as `TessControl`
HXSW.hx:381: hxsw / reached new block, existing block open? true
HXSW.hx:381: hxsw / shaderkey was `Fragment.ios.Grassfire`
HXSW.hx:381: hxsw / store TimeMachine.Fragment.ios.Grassfire with `65` size
HXSW.hx:381: hxsw / at line 10, effect shader key `TessControl`
HXSW.hx:381: hxsw / switched context to TimeMachine.TessControl
HXSW.hx:381: hxsw / prepend directive due to effect token `TimeMachine` #version 140
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw /	 11: QUUX
HXSW.hx:381: hxsw / line -- TessEvaluation
HXSW.hx:381: hxsw / alpha sequence found as `TessEvaluation`
HXSW.hx:381: hxsw / reached new block, existing block open? true
HXSW.hx:381: hxsw / shaderkey was `TessControl`
HXSW.hx:381: hxsw / store TimeMachine.TessControl with `42` size
HXSW.hx:381: hxsw / at line 12, effect shader key `TessEvaluation`
HXSW.hx:381: hxsw / switched context to TimeMachine.TessEvaluation
HXSW.hx:381: hxsw / prepend directive due to effect token `TimeMachine` #version 140
HXSW.hx:381: hxsw / prepend directive due to blank token #define HXSW 1
HXSW.hx:381: hxsw /	 13: QUUUX
HXSW.hx:381: hxsw /	 14: 
HXSW.hx:381: hxsw / store TimeMachine.TessEvaluation with `44` size
HXSW.hx:381: hxsw / finding match for TimeMachine.Vertex.Grassfire...
HXSW.hx:381: hxsw / 	 check:`Blit.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Geometry` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.ios.Grassfire` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Vertex` ... 
HXSW.hx:381: hxsw / 	 match> closest set to `TimeMachine.Vertex`
HXSW.hx:381: hxsw / 	 check:`TimeMachine.TessControl` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.TessEvaluation` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment.ios` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.Erosion` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.Grassfire` ... 
HXSW.hx:381: hxsw / closestkey found as `TimeMachine.Vertex`
Main.hx:60: TimeMachine.Vertex.Grassfire:
Main.hx:65: #define HXSW 1
#version 140
#line 0
FOO

HXSW.hx:381: hxsw / request shader from TimeMachine
HXSW.hx:381: hxsw / already loaded? true
HXSW.hx:381: hxsw / finding match for TimeMachine.Fragment.Grassfire...
HXSW.hx:381: hxsw / 	 check:`Blit.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Geometry` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.ios.Grassfire` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.TessControl` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.TessEvaluation` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment.ios` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.Erosion` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.Grassfire` ... 
HXSW.hx:381: hxsw / 	 match> closest set to `TimeMachine.Fragment.Grassfire`
HXSW.hx:381: hxsw / closestkey found as `TimeMachine.Fragment.Grassfire`
Main.hx:60: TimeMachine.Fragment.Grassfire:
Main.hx:65: #define HXSW 1
#version 140
#line 6
QUX

HXSW.hx:381: hxsw / request shader from TimeMachine
HXSW.hx:381: hxsw / already loaded? true
HXSW.hx:381: hxsw / finding match for TimeMachine.Fragment.Cilantro...
HXSW.hx:381: hxsw / 	 check:`Blit.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Geometry` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.ios.Grassfire` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.TessControl` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.TessEvaluation` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment.ios` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.Erosion` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.Grassfire` ... 
HXSW.hx:381: hxsw / closestkey not found :<
Main.hx:60: TimeMachine.Fragment.Cilantro:
Main.hx:63: Could not find shader with key TimeMachine.Fragment.Cilantro
HXSW.hx:381: hxsw / request shader from TimeMachine
HXSW.hx:381: hxsw / already loaded? true
HXSW.hx:381: hxsw / finding match for TimeMachine.Fragment.ios.Grassfire...
HXSW.hx:381: hxsw / 	 check:`Blit.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Geometry` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.ios.Grassfire` ... 
HXSW.hx:381: hxsw / 	 match> closest set to `TimeMachine.Fragment.ios.Grassfire`
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Vertex` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.TessControl` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.TessEvaluation` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment` ... 
HXSW.hx:381: hxsw / 	 check:`Blit.Fragment.ios` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.Erosion` ... 
HXSW.hx:381: hxsw / 	 check:`TimeMachine.Fragment.Grassfire` ... 
HXSW.hx:381: hxsw / closestkey found as `TimeMachine.Fragment.ios.Grassfire`
Main.hx:60: TimeMachine.Fragment.ios.Grassfire:
Main.hx:65: precision mediump float;
#define HXSW 1
#version 140
#line 8
IOS

HXSW.hx:381: hxsw / request shader from Madrid
HXSW.hx:381: hxsw / already loaded? false
HXSW.hx:381: hxsw / loading from file Madrid.glsl
Main.hx:76: attempt to load Madrid.glsl
Main.hx:85: cannot open Madrid.glsl / ([file_open,Madrid.glsl])
Main.hx:60: Madrid:
Main.hx:63: Unable to open effect file Madrid.glsl
HXSW.hx:381: hxsw / destroyed shader wrangler
