var random1, random2;

$.ajax("/random1").then(
    function(value){ 
	random1 = value['number'];
	return $.ajax("/random2");
    }
).then(
    function(value){
	random2 = value['number'];
	return $.ajax("/sum?one=" + random1 + "&" + "two=" + random2);
    }
).then(
    function(value){
	alert(random1 + " + " + random2 + " = " + value['sum']);
    }
);
