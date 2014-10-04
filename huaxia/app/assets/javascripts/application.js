// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.qtip.js

$(document).ready(function(){
	//When mouse rolls over
	$("li#parent-list-univ").mouseover(function(){
		$("ul.list-univ").slideDown(1);
  });

	//When mouse is removed
	$("li#parent-list-univ").mouseleave(function(){
		$("ul.list-univ").fadeOut(1);
  });

  $("li#parent-list-info").mouseover(function(){
		$("ul.list-info").slideDown(1);
  });

	//When mouse is removed
	$("li#parent-list-info").mouseleave(function(){
		$("ul.list-info").fadeOut(300);
  });

  $("li#parent-list-book").mouseover(function(){
		$("ul.list-book").slideDown(1);
  });

	//When mouse is removed
	$("li#parent-list-book").mouseleave(function(){
		$("ul.list-book").fadeOut(300);
  });

  $("li#parent-list-gallery").mouseover(function(){
		$("ul.list-gallery").slideDown(1);
  });

	//When mouse is removed
	$("li#parent-list-gallery").mouseleave(function(){
		$("ul.list-gallery").fadeOut(300);
  });


});

function display_sub_menu(province){
  var my_self = $("ul.child#"+province)
  if(my_self.is(':hidden')){
    $(my_self).show("slow");
  }else{
    $('ul.child').hide("slow");
  }
  $('ul.child').not(my_self).hide("slow");

}