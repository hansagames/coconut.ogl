package ogl;

@:jsRequire("ogl", "Vec3")
extern class Vec3 {
    public function new(?x: Float, ?y: Float, ?z: Float): Void;
    var x: Float;
    var y: Float;
    var z: Float;
    public function set(x: Float, y: Float, z: Float): Void;
    public function multiply(v: Float): Vec3;
    public function negate(?v: Vec3): Vec3;
    public function normalize(): Vec3;
    public function clone(): Vec3;
    public function copy(v: Vec3): Vec3;
    public function sub(v: Vec3, ?v2: Vec3): Vec3;
}