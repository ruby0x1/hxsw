______  _  _  _
| ___ \| |(_)| |
| |_/ /| | _ | |_
| ___ \| || || __|
| |_/ /| || || |_
\____/ |_||_| \__|

-------- Vertex --------

in vec4 Position;
void main() {
    gl_Position = Position;
}

--- /\/\/\/\/\/\/\/\ ---

Contrariwise, if it was so, it might be; and if it were so,
it would be; but as it isn't, it ain't. That's logic.

--[[[[[ Fragment <== Brigadier Lethbridge-Stewart

uniform sampler2D Sampler;
out vec4 FragColor;
void main() {
    ivec2 coord = ivec2(gl_FragCoord.xy);
    FragColor = texelFetch(Sampler, coord, 0);
}

-- Fragment.ios

uniform sampler2D tex0;
void main() {
    gl_FragColor = texture2D(tex0, tcoord);
}
