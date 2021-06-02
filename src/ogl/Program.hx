package ogl;

typedef CreateProgramProps = {
    var vertex: String;
    var fragment: String;
    var ?uniforms: Dynamic;
    var ?cullFace: Null<Int>;
    var ?depthTest: Bool;
    var ?depthFunc: Int;
    var ?frontFace: Int;
}
typedef Uniform<T> = {
    var value: T;
} 
@:jsRequire("ogl", "Program")
extern class Program {
    public var uniforms: Dynamic;
    public function new(gl: GL, options: CreateProgramProps): Void;
}