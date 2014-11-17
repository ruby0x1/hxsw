
import hxsw.HXSW;

class Main {

    var sw : HXSW;

        //called by haxe at load
    static function main() {
       new Main();
    } //main

    function new() {

            //there are defaults for these,
            //this is to demonstrate/test
            //only the load_effect is needed
            //to make sense of implementing

            // glswInit();
            // glswSetPath("./", ".glsl");
        sw = new HXSW({
            path : './',
            ext : '.glsl',
            logging : false,
            load_effect : load_effect
        });

            sw.add_directive("", "#define HXSW 1");
            sw.add_directive("Blit", "#define is_blit 1");
            sw.add_directive("ios", "precision mediump float;");

            //const char* vs = glswGetShader("Blit.Vertex");
            //const char* fs = glswGetShader("Blit.Fragment");

        var vs = sw.get('Blit.Vertex');
        var fs = sw.get('Blit.Fragment');
        var fsi = sw.get('Blit.Fragment.ios');

        trace('Blit.Vertex: \n$vs');
        trace('Blit.Fragment: \n$fs');
        trace('Blit.Fragment.ios: \n$fsi');

            sw.add_directive("TimeMachine", "#version 140");

        test("TimeMachine.Vertex.Grassfire");
        test("TimeMachine.Fragment.Grassfire");
        test("TimeMachine.Fragment.Cilantro");
        test("TimeMachine.Fragment.ios.Grassfire");
        test("Madrid");

        sw.destroy();

    } //new

    function test(key:String) {

        var shader = sw.get(key);

        trace('$key:');

        if(shader == '') {
            trace(sw.error);
        } else {
            trace(shader);
        }

    } //test

        //Note that this function uses
        //sys.io classes which aren't
        //available on some haxe targets

    function load_effect( path:String ) {

        trace('attempt to load $path');
        var file : sys.io.FileInput = null;
        var content = '';

        try {
            file = sys.io.File.read( path, false );
            content = file.readAll().toString();
            file.close();
        } catch( e:Dynamic ) {
            trace('cannot open $path / ($e)');
            if(file != null) file.close();
        }

        return content;

    } //load_effect

} //Main
