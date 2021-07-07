package ogl;

import ogl.Program;
import ogl.Geometry;
import ogl.Transform;

typedef CreateMeshProps = {
    final program: Program;
    final geometry: Geometry;
};
@:jsRequire("ogl", "Mesh")
extern class Mesh extends Transform {
    var scale: Vec3;
    var program: Program;
    var geometry: Geometry;
    public function new(gl: GL, options: CreateMeshProps): Void;
}