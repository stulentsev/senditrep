$(function() {    
    $( ".autocomplete" ).autocomplete({
    	source: function( request, response ) {
	    			var matches = $.map( availableCities, function(acItem) {
	      			if ( acItem.toUpperCase().indexOf(request.term.toUpperCase()) === 0 ) {
	        			return acItem;
	      			}
    			});
    			response(matches);
 	 	},
      	minLength: 3,
      	autoFocus:true,
      	delay: 100
    });
  });