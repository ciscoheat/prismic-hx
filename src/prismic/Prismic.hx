package prismic;

typedef PrismicApiOptions = {
	@:optional var complete : Error -> Api -> Void;
	@:optional var accessToken : String;
	#if js_kit
	@:optional var req : js.npm.express.Request;
	#elseif nodejs
	@:optional var req : Dynamic;
	#end
	@:optional var requestHandler : haxe.Constraints.Function;
	@:optional var apiCache : Dynamic;
	@:optional var apiDataTTL : Int;
}

@:jsRequire('prismic.io')
extern class Prismic
{
	@:overload(function(url : String) : js.Promise<Api> {})
	public static function api(url : String, options : PrismicApiOptions) : js.Promise<Api>;
}
