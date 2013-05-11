var random1, random2;

$.ajax("/random1", {
    success: function(data){
	random1 = data["number"]
	$.ajax("/random2",{
	    success: function(data){
		random2 = data["number"]
		$.ajax("/sum?one=" + random1 + "&" + "two=" + random2, {
		    success: function(data){
			alert(random1 + " + " + random2 + " = " + data['sum']);
		    },
		    error: function(xhr, status){
			alert(status);
		    }
		});
	    },
	    error: function(xhr, status){
		alert(status);
	    }
	});
    },
    error: function(xhr, status){
	alert(status);
    }
});
