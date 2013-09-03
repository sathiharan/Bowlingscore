// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
      
$().ready(function(){
  $('#chance1').bind('keyup', function(){
	
	function strike() {
    return $('#chance1').val() == 10
  }
	  	
  if(strike()) {
  	     $('#block-chance2').hide();
  	     $('#label2').hide();
    }
    else {      
      $('#block-chance2').show();
      $('#label2').show();
    }    
  
  })
  
 function spare() {
    return Number($('chance1').val()) + Number($('chance2').val())
  } 

 $('#sub').click(function(){  	
 	if(spare > 10)
  {
  	alert("The score you entered is wrong")
  } 	
  
  }) 
  
    
});
  
  



	
