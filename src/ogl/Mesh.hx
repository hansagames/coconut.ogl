package ogl;

import ogl.Program;
import ogl.Geometry;
import ogl.Transform;

typedef CreateMeshProps = {
    var program: Program;
    var geometry: Geometry;
};
@:jsRequire("ogl", "Mesh")
extern class Mesh extends Transform {
    var scale: Vec3;
    var program: Program;
    public function new(gl: GL, options: CreateMeshProps): Void;
}