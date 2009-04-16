// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

	function show_float_div(id) {


	
	node = document.getElementsByTagName("body")[0];

	var myElement = document.getElementById(id);
	if(myElement.style.display == 'none'){

		var type = 'inline';

	}else {

		var type = 'none';    

		}


	
	var re = new RegExp('\\b' + 'floating_div' + '\\b');
	
	var els = node.getElementsByTagName("*");
	
	for(var i=0,j=els.length; i<j; i++)
	
	if(re.test(els[i].className)) els[i].style.display = 'none';
	
	myElement.style.display = type;
	}

	 
