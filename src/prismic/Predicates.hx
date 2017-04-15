package prismic;

@:jsRequire('prismic.io', 'Predicates')
extern class Predicates
{
	@:overload(function(path : Path, values : Array<String>) : Predicate {})
	static function at(path : Path, value : String) : Predicate;

	@:overload(function(path : Path, values : Array<String>) : Predicate {})
	static function not(path : Path, value : String) : Predicate;

	static function missing(path : Path) : Predicate;
	static function has(path : Path) : Predicate;
	static function any(path : Path, values : Array<String>) : Predicate;
	@:native("in") static function _in(path : Path, values : Array<String>) : Predicate;
	static function fulltext(path : Path, value : String) : Predicate;
	static function similar(documentId : String, maxResults : Int) : Predicate;
	static function gt(path : Path, value : Float) : Predicate;
	static function lt(path : Path, value : Float) : Predicate;
	static function inRange(path : Path, start : Float, end : Float) : Predicate;

	@:overload(function(path : Path, after : Float) : Predicate {})
	static function dateAfter(path : Path, after : Date) : Predicate;

	@:overload(function(path : Path, before : Float) : Predicate {})
	static function dateBefore(path : Path, before : Date) : Predicate;

	@:overload(function(path : Path, start : Float, end : Float) : Predicate {})
	static function dateBetween(path : Path, start : Date, end : Date) : Predicate;

	static function dayOfMonth(path : Path, day : Int) : Predicate;
	static function dayOfMonthAfter(path : Path, day : Int) : Predicate;
	static function dayOfMonthBefore(path : Path, day : Int) : Predicate;
	static function dayOfWeek(path : Path, day : Int) : Predicate;
	static function dayOfWeekAfter(path : Path, day : Int) : Predicate;
	static function dayOfWeekBefore(path : Path, day : Int) : Predicate;
	static function month(path : Path, month : Int) : Predicate;
	static function monthBefore(path : Path, month : Int) : Predicate;
	static function monthAfter(path : Path, month : Int) : Predicate;
	static function year(path : Path, year : Int) : Predicate;
	static function hour(path : Path, hour : Int) : Predicate;
	static function hourBefore(path : Path, hour : Int) : Predicate;
	static function hourAfter(path : Path, hour : Int) : Predicate;
	static function near(path : Path, latitude : Float, longitude : Float, radius : Float) : Predicate;

	static function toQuery(predicate : Predicate) : String;
}

abstract Predicate(Array<String>) {}

@:enum abstract Path(String) from String to String {
	var DocumentType = "document.type";
	var DocumentId = "document.id";
	var DocumentTags = "document.tags";
	var DocumentFirstPublicationDate = "document.first_publication_date";
	var DocumentLastPublicationDate = "document.last_publication_date";
	var Document = "document";
}