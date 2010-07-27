dojo.provide('cookbooks.tests.dispatcher');
dojo.require('cookbook.Dispatcher');

(function(d, $, beTrue, beFalse, beEqual) {
	
	var sut = cookbook.Dispatcher;
	
	doh.register("cookbooks.tests.dispatcher", [

		function should_generate_dispatchers() {

			var dispatchers = sut.create(/blah/, function() {});
			doh.assertEqual(1, dispatchers.length);
			
			var dispatchers = sut.create([[/blah/, function() {}], [/blah/, function() {}], [/blah/, function() {}]]);
			doh.assertEqual(3, dispatchers.length);

		},

		function should_read_path() {
			
			var dispatched = false;
			
			var dispatchers = sut.create(/blah/, function() {
				dispatched = true;
			});
			
			var path = 'http://woo.com/blah';
			
			dispatchers.forEach(function(dispatcher) {
				dispatcher(path);
			});
			
			beTrue(dispatched);
		},
		
		function should_only_dispatch_when_matched() {
			
			var dispatched = false;
			
			var dispatchers = sut.create(/blah/, function() {
				dispatched = true;
			});
			
			var path = 'http://woo.com/bslah';
			
			dispatchers.forEach(function(dispatcher) {
				dispatcher(path);
			});
			
			beFalse(dispatched);
			
		}

	]);
	
})(dojo, dojo.query, doh.assertTrue, doh.assertFalse, doh.assertEqual);
