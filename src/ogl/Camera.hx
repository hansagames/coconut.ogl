package ogl;

typedef CreateCameraProps = {
    var ?fov: Int;
}
typedef CameraPerspectiveProps = {
    var aspect: Float;
}
@:jsRequire("ogl", "Camera")
extern class Camera extends Transform { 
    public function new(gl: GL, options: CreateCameraProps): Void;
    public function perspective(props: CameraPerspectiveProps): Void;
}