using buddy.Should;

import prismic.*;
import prismic.Predicates.Path;

class RunTests extends buddy.SingleSuite
{
	public function new() {
		timeoutMs = 10000;
		describe("Prismic Api", {
			var api : Api;
			beforeAll(function(done) {
				Prismic.api("https://prismic-hx.prismic.io/api", {complete: function(err, a: Api) {
					if(err != null) throw err;
					api = a;
					done();
				}});
			});

			it("should return a single document", function(done) {
				api.getSingle("start", function(err : Error, doc : Doc) {
					if(err != null) return fail(err);
					//js.Node.console.dir(doc, {depth:8});
					doc.uid.should.be("the-start-page");
					done();
				});
			});

			it("should return multiple documents using predicates", function(done) {
				api.query([
					Predicates.at(DocumentType, 'page'), 
					//Predicates.dateBetween(DocumentFirstPublicationDate, Date.fromString("2017-01-01"), Date.fromString("2020-01-01"))
					Predicates.dateAfter(DocumentFirstPublicationDate, Date.fromString("2017-01-01"))
				], {
					orderings: '[my.page.title desc]'
				}, function(err, response) {
					if(err != null) return fail(err);
					//js.Node.console.dir(response, {depth:8});
					response.results_size.should.be(2);
					response.results[0].uid.should.be("page2");
					response.results[1].uid.should.be("page1");
					done();
				});
			});
		});
	}
}
