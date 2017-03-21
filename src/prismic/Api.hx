package prismic;

import js.html.XMLHttpRequest;
import prismic.Predicates.Predicate;

extern class Api
{
	public function refresh(cb : Error -> Void) : Void;
	public function currentExperiment() : Dynamic;
	
	@:overload(function(bookmark : String, options : {}, cb : Error -> Doc -> Void) : Void {})
	public function getBookmark(bookmark : String, cb : Error -> Doc -> Void) : Void;

	@:overload(function(id : String, options : {}, cb : Error -> Doc -> Void) : Void {})
	public function getByID(id : String, cb : Error -> Doc -> Void) : Void;	

	@:overload(function(ids : Array<String>, options : {}, cb : Error -> Array<Doc> -> Void) : Void {})
	public function getByIDs(ids : Array<String>, cb : Error -> Array<Doc> -> Void) : Void;

	@:overload(function(pageType : String, uid : String, options : {}, cb : Error -> Doc -> Void) : Void {})
	public function getByUID(pageType : String, uid : String, cb : Error -> Doc -> Void) : Void;	

	@:overload(function(pageType : String, options : {}, cb : Error -> Doc -> Void) : Void {})
	public function getSingle(pageType : String, cb : Error -> Doc -> Void) : Void;
	
	public function master() : String;
	public function previewSession(token : String, linkResolver : LinkResolver, defaultUrl : String, cb : Error -> String -> Null<XMLHttpRequest> -> Void) : Void;

	@:overload(function(q : Array<Predicate>, options : {}, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Array<Predicate>, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Array<String>, options : {}, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Array<String>, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Predicate, options : {}, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Predicate, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : String, options : {}, cb : Error -> PrismicResponse -> Void) : Void {})
	public function query(q : String, cb : Error -> PrismicResponse -> Void) : Void;

	@:overload(function(q : Array<Predicate>, options : {}, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Array<Predicate>, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Array<String>, options : {}, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Array<String>, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Predicate, options : {}, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : Predicate, cb : Error -> PrismicResponse -> Void) : Void {})
	@:overload(function(q : String, options : {}, cb : Error -> PrismicResponse -> Void) : Void {})
	public function queryFirst(q : String, cb : Error -> PrismicResponse -> Void) : Void;
	
	public function request(url : String, cb : Error -> PrismicResponse -> Null<XMLHttpRequest> -> Void) : Void;
	public function response(doc : {}) : PrismicResponse;

	public static var previewCookie(default, null) : String;
	public static var experimentCookie(default, null) : String;
}
