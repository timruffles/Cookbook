dojo.provide('cookbook.Dispatcher');


// not really needed - using javascript_auto_include instead
(function(d, $) {
	
	var toArray = function(candidate) {
		return d.isArray(candidate) ? candidate : [candidate];
	};
	
	
	cookbook.Dispatcher = {
		
		dispatch: function(dispatchers) {
			
			
		},
		create: function(matchers, action) {
			var self = this;
			return action ? [this._create(matchers, action)] : matchers.map(function(matcher_action) { 
				return self._create(matcher_action[0], matcher_action[1]);
			});
		},
		_create: function(matchers, action) {
			return function(path) {
				console.log(matchers, toArray(matchers));
				return toArray(matchers).some(function(matcher) { 
					if(matcher.test(path)) {
						action(path); 
						return true;
					}
					return false;
				});
			};
		}

	};


})(dojo, dojo.query);