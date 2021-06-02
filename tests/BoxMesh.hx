package;

import ogl.Program;
import ogl.Box;
import ogl.GL;
import ogl.Mesh;

class BoxMesh extends Mesh {
    public function new(gl: GL) {
        super(gl, { 
            geometry: new Box(gl), 
            program: new Program(
                gl,
                {
                    vertex: Webpack.require("./box.vert.glsl"),
                    fragment: Webpack.require("./box.frag.glsl"),
                }
            )
        });
    }
}