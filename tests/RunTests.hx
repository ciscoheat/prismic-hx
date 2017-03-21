using buddy.Should;

import prismic.*;

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

			it("should return a single document properly", function(done) {
				api.getSingle("start", function(err : js.Error, doc : Doc) {
					if(err != null) return fail(err);
					//js.Node.console.dir(doc, {depth:8});
					doc.uid.should.be("the-start-page");
					done();
				});
			});

			it("should return multiple documents properly", function(done) {
				api.query(Predicates.at('document.type', 'page'), {
					orderings: '[my.page.title desc]'
				}, function(err, response) {
					if(err != null) return fail(err);
					//js.Node.console.dir(response.results[0], {depth:8});
					response.results_size.should.be(2);
					response.results[0].uid.should.be("page2");
					response.results[1].uid.should.be("page1");
					done();
				});
			});
		});
	}
}
