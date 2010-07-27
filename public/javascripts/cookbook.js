(function(d, $) {
	
	var url = document.location;
	var onPage = function() {
		args = [].slice.call(arguments);
		return args.some(function(page) { return url.indexOf(page) != -1 });
	};
	
	
	var addStar = function() {
		
	};
	var chefHandler = function() {
		
	};
	var recipeHandler = function() {
		
	};
	var homeHandler = function() {
		
	};
	
	
	d.addOnLoad(function(){
		
		var handler = false;
		if(onPage('chef')) {
			handler = chefHandler;
				
			};
		} else if(onPage('recipe')) {
			handler = recipeHandler;
		} else {
			handler = homeHandler;
		}
		
		$('#bookmark').click(function(){

		});
	});
	
})(dojo, dojo.query);