package hxsw;


typedef HXSWOptions = {
    @:optional var path : String;
    @:optional var ext : String;
    @:optional var logging : Bool;
    @:optional var log : Dynamic->Void;
    @:optional var load_effect : String->String;
}

/**

Haxe shader wrangler
Copyright (c) Sven Bergstrom 2014
License MIT (see LICENSE.md)

Ported from the original:
"OpenGL Shader Wrangler"
Copyright (c) Philip Rideout 2010
Covered by the MIT License
http://prideout.net/blog/?p=11

v 1.0.0

Implementation detail notes at the end of the file.

*/
class HXSW {

        /** The base path, prefixed to the shader file path at load time.
            default: `./` */
    public var path : String = './';
        /** The effect file extension to append to file path at load time.
            Must include a period: `.ext`
            default: `.glsl` */
    public var ext : String = 'glsl';
        /** Required: A callback to load the effect file data. example:
            hxsw.load_effect = function(path:String) {
                content = //file read/string fetch magic
                return content;
            } */
    public var load_effect : String->String;
        /** The last encounted error string, if no errors are set, it will be blank ''.
            Errors are encountered under the following conditions:
                - Malformed effect key `$effectkey`
                    - set when the effect key requested is invalid.
                    - a valid effectkey has Effect.Shader, requiring a . delimeter
                - Unable to open effect file `$effectfile`
                    - set when the file load function returns a blank string
                    - implementation details of the reasons are outside of this code
                - Could not find shader with key `$effectkey`;
                    - get requested a shader that was not found
                - Cannot add blank directive, only blank token.
                    - storing a blank directive makes no sense, only blank token is valid
        */
    public var error : String = '';
        /** For debugging, enable logging to see what the parser/searching is thinking. */
    public var logging : Bool = false;
        /** A simple hook for the logging. default: `trace` */
    public var log : Dynamic->Void;

        /** The map of shaderkey -> shader source */
    public var shadermap : Map<String, String>;
        /** The map of tokens -> directives */
    public var tokenmap : Map<String, Array<String>>;
        /** The list of loaded effects */
    public var loaded : Array<String>;


    //Public API


            /** Construct a new instance of the wrangled. */
        public function new( ?options:HXSWOptions ) {

            _log('hxsw / created shader wrangler');

            shadermap = new Map();
            tokenmap = new Map();
            loaded = [];

            apply_options(options);

        } //new

            /** Clean up used resources and flush maps etc. */
        public function destroy() {

            for(s in shadermap) s = null;
            for(l in tokenmap) {
                l.splice(0,l.length); l = null;
            }

            loaded.splice(0, loaded.length);

            shadermap = null;
            tokenmap = null;
            loaded = null;

            _log('hxsw / destroyed shader wrangler');

        } //destroy

        public function get( effectkey:String ) : String {

            var effectname = '';
            var shaderkey = '';
            var tokens : Array<String> = [];

            // Extract the effect name from the effect key

                tokens = effectkey.split('.');
                if(tokens.length == 0) {
                    error = 'Malformed effect key `$effectkey`';
                    tokens = null;
                    return '';
                }

                effectname = tokens[0];

                _log('hxsw / request shader from $effectname');

            // Check if we already loaded this effect file

                var existing = loaded.indexOf(effectname) != -1;

                _log('hxsw / already loaded? ${existing}');

            // If we haven't loaded this file yet, load it in

                if(!existing) {

                    var effectcontents = '';
                    var lines = [];
                    var lineno = 0;

                    {
                        // Decorate the effect name to form the fullpath
                            var effectfile = haxe.io.Path.join([path, effectname+ext] );
                            _log('hxsw / loading from file $effectfile');
                        // Attempt to open the file
                            var content = load_effect(effectfile);
                            if(content == '') {
                                error = 'Unable to open effect file $effectfile';
                                return '';
                            }
                        // Add a new entry to the loaded effects
                            loaded.push(effectname);
                        // Read in the effect file
                            effectcontents = content;
                    }

                    lines = effectcontents.split('\n');

                    var shadermapkey = '';
                    var shadercontent = '';

                    inline function commit_shader_content() {
                        _log('hxsw / store $shadermapkey with `${shadercontent.length}` size');
                        shadermap.set(shadermapkey, shadercontent);
                        shadercontent = '';
                        shadermapkey = '';
                    }

                    while(lineno < lines.length) {

                        var line = lines[lineno];

                        // If the line starts with "--", then it marks a new section

                            if(StringTools.startsWith(line, '--')) {

                                // Find the first character in [a-zA-Z0-9_.].
                                _log('hxsw / line $line');

                                var col = 2;
                                while(col < line.length) {
                                    var c = line.charAt(col);
                                    if(is_alphanumeric(c)) {
                                        break;
                                    }
                                    col++;
                                }
                                if(col >= line.length) {

                                    //if pre-existing block, store it
                                    if(shaderkey != '') commit_shader_content();

                                    // If there's no alphanumeric character,
                                    // then this marks the start of a new comment block.
                                    shaderkey = '';
                                    _log('hxsw / skipping section until next block');

                                } else {

                                    // Keep reading until a non-alphanumeric character is found.
                                    var endcol = col;
                                    while(endcol < line.length) {
                                        var c = line.charAt(endcol);
                                        if(!is_alphanumeric(c)) {
                                            break;
                                        }
                                        endcol++;
                                    }

                                    _log('hxsw / alpha sequence found as `' + line.substr(col, endcol - col) + '`');
                                    _log('hxsw / reached new block, existing block open? ${shaderkey != ""}');
                                    _log('hxsw / shaderkey was `$shaderkey`');

                                        //if we have an existing block open,
                                        //store the shader content in the map
                                        //since we are starting a new block
                                    if(shaderkey != '') commit_shader_content();

                                    shaderkey = line.substr(col, endcol - col);

                                    // Add a new entry to the shader map.
                                    {
                                        shadercontent = '#line $lineno\n';
                                        shadermapkey = '$effectname.$shaderkey';
                                        _log('hxsw / at line $lineno, effect shader key `$shaderkey`');
                                        _log('hxsw / switched context to $shadermapkey');
                                    }

                                    // Check for a version mapping.
                                    if(Lambda.count(tokenmap) > 0) {

                                        var keytokens = shaderkey.split('.');
                                        for(tokenkey in tokenmap.keys()) {

                                            var directives = tokenmap.get(tokenkey);
                                            for(directive in directives) {

                                                // An empty key in the token mapping means "always prepend this directive".
                                                // The effect name itself is also checked against the token mapping.
                                                var effectdirective = (tokenkey == effectname);
                                                if(0 == tokenkey.length || effectdirective) {
                                                    _log('hxsw / prepend directive due to ' + (effectdirective ? 'effect token `$tokenkey`' : 'blank token') + ' ${StringTools.trim(directive)}');
                                                    shadercontent = directive + shadercontent;
                                                }

                                                // Check all tokens in the current section divider for a mapped token.
                                                for(keytoken in keytokens) {
                                                    if(keytoken == tokenkey) {
                                                        _log('hxsw / prepend directive due to $keytoken: ${StringTools.trim(directive)}');
                                                        shadercontent = directive + shadercontent;
                                                    }
                                                }

                                            } //each directive for the token

                                        } //each token in the tokenmap

                                        keytokens = null;

                                    } //tokenmap has values

                                } //has alphanumeric

                                lineno++;
                                continue;

                            } //line starts with --

                            if(shaderkey != '') {
                                shadercontent += '$line\n';
                                _log('hxsw /\t $lineno: $line');
                            }

                        lineno++;

                    } //while line count

                    if(shadermapkey != '') commit_shader_content();

                    lines = null;

                } //!existing


            //Find the longest matching shader key


                    inline function find_match( effectkey:String ) : String {

                        var closestkey = '';

                        _log('hxsw / finding match for $effectkey...');

                        for(entry in shadermap.keys()) {
                            _log('hxsw / \t check:`$entry` ... ');
                            var pos = effectkey.indexOf(entry);
                            if(pos == 0 && (closestkey != '' || (entry.length > closestkey.length))) {
                                closestkey = entry;
                                _log('hxsw / \t match> closest set to `$closestkey`');
                            }
                        }

                        if(closestkey == '') {
                            _log('hxsw / closestkey not found :<');
                            error = 'Could not find shader with key $effectkey';
                            return '';
                        }

                        _log('hxsw / closestkey found as `$closestkey`');
                        return shadermap.get(closestkey);

                    } //find_match


            return find_match(effectkey);

        } //get

            /** Add a directive to a token. */
        public function add_directive( token:String, directive:String ) : Bool {

            if(directive == '') {
                error = 'Cannot add blank directive, only blank token. given token:`$token` / directive:`$directive`';
                return false;
            }

            var list = tokenmap.get(token);
            if(list == null) {
                list = [];
            }

            list.unshift('$directive\n');

            tokenmap.set(token, list);

            return true;

        } //add_directive

    //internal helpers

        function is_alphanumeric( s:String ) {
            var c = s.charCodeAt(0);
            return
                (c >= 'A'.charCodeAt(0) && c <= 'Z'.charCodeAt(0)) ||
                (c >= 'a'.charCodeAt(0) && c <= 'z'.charCodeAt(0)) ||
                (c >= '0'.charCodeAt(0) && c <= '9'.charCodeAt(0)) ||
                 s == '_' || s == '.';
        }

            //set + apply any provided and internal defaults
        function apply_options( options:HXSWOptions ) {

            if(options.load_effect != null) {
                load_effect = options.load_effect;
            } else {
                load_effect = _load_effect;
            }

            if(options.log != null)     log = options.log;
            if(options.logging != null) logging = options.logging;
            if(options.path != null)    path = options.path;
            if(options.ext != null)     ext = options.ext;

        } //apply_options

            //the default load handler
        function _load_effect( path:String ) {

            trace('HXSW / Assign a load_effect handler! ');

            return '';

        } //default_load_effect

            //the internal log wrapper
        function _log( val ) {

            if(!logging) return;

            if(log != null) {
                _log(val);
            } else {
                trace(val);
            }

        } //log


} //HXSW

/**

Implementation detail differences :

Keys for the directives are stored in array by token,
the original library stored them in a linked list, allowing
redundant Key/Value pairs. This doesn't change features etc.

loaded effects list is a simple array of strings.

Code order is almost the same, except the find is factored
out into an inline function, the map set timing had to change
due to writing to a pointer in a structure vs explicit set times.

Verbose optional logging for understanding the system, with callback.

Callback hook for loading the effect source file for easy integration.

*/