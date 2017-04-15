using buddy.Should;

import prismic.*;
import prismic.Predicates as Pred;

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

			describe("Query helpers", function() {
				it("should return a single type document", function(done) {
					api.getSingle("start", function(err : Error, doc : Doc) {
						if(err != null) return fail(err);
						doc.uid.should.be("the-start-page");
						done();
					});
				});

				it("should return a document based on uid", function(done) {
					api.getByUID('page', 'page2', function(err : Error, doc : Doc) {
						if(err != null) return fail(err);
						doc.uid.should.be("page2");
						done();
					});
				});

				it("should return a document based on id", function(done) {
					api.getByID('WNAxCycAACcAhsnJ', function(err : Error, doc : Doc) {
						if(err != null) return fail(err);
						doc.uid.should.be("the-start-page");
						done();
					});
				});

				it("should return a document based on their id's", function(done) {
					api.getByIDs(
						['WNA14icAACkAht8Y', 'WNBr1ycAACgAh8xn'],
						{orderings: '[page.title]'},
						function(err : Error, docs : PrismicResponse)
					{
						if(err != null) return fail(err);
						docs.results_size.should.be(2);
						docs.results[0].uid.should.be("page1");
						docs.results[1].uid.should.be("page2");
						done();
					});
				});
			});

			describe("Predicate querying", function() {
				it("should return a document based on id", function(done) {
					api.query(Pred.at(DocumentId, 'WNAxCycAACcAhsnJ'), function(err, response : PrismicResponse) {
						if(err != null) return fail(err);
						response.results_size.should.be(1);
						response.results[0].uid.should.be("the-start-page");
						done();
					});
				});

				it("should return documents based on tag filters", function(done) {
					api.query(Pred.at(DocumentTags, ['tagged']), function(err, response : PrismicResponse) {
						if(err != null) return fail(err);
						response.results_size.should.be(1);
						response.results[0].uid.should.be("page2");
						done();
					});
				});

				it("should return multiple documents using multiple predicates", function(done) {
					api.query([
						Pred.at(DocumentType, 'page'), 
						Pred.dateAfter(DocumentFirstPublicationDate, Date.fromString("2017-01-01")),
						Pred.dateBetween(DocumentFirstPublicationDate, Date.fromString("2017-01-01"), Date.fromString("2030-01-01")),
						Pred.dateBefore(DocumentLastPublicationDate, Date.fromString("2030-01-01")),
						Pred.not(DocumentTags, ['not-this-tag'])
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

				it("should return documents based on tag filters", function(done) {
					api.query(Pred.at(DocumentTags, ['tagged']), function(err, response : PrismicResponse) {
						if(err != null) return fail(err);
						response.results_size.should.be(1);
						response.results[0].uid.should.be("page2");
						done();
					});
				});

				it("should return documents based on fulltext search", function(done) {
					api.query(Pred.fulltext(Document, 'Page 1'), function(err, response : PrismicResponse) {
						if(err != null) return fail(err);
						response.results_size.should.be(1);
						response.results[0].uid.should.be("page1");
						done();
					});
				});

				it("should return documents based on custom fields", function(done) {
					api.query([
						Pred.at(DocumentType, 'page'),
						Pred.fulltext('my.page.title', 'Page')
					], function(err, response : PrismicResponse) {
						if(err != null) return fail(err);
						response.results_size.should.be(2);
						response.results[0].uid.should.be("page1");
						response.results[1].uid.should.be("page2");
						done();
					});
				});
			});
		});
	}
}
