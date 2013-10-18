$(function() {    
    $( ".autocomplete" ).autocomplete({
      source: availableCities,
      minLength: 3,
      autoFocus:true,
      delay: 100
    });
  });