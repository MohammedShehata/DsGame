// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function check(data){
	var idArr = [];
	var trs = document.getElementsByTagName("tr");
	for(var i=0;i<trs.length;i++)
	{
	   idArr.push(trs[i].id);
	}
	for (var i=0; i < idArr.length; i++) {
	   var gout= false ;
	  for (var j=0;!gout && j < data.length; j++) {
		if(data[j][0]==idArr[i]){
			gout=true;
		}
	  };
	  if(!gout){
	  	hide(idArr[i]);
	  }
	};
	for (var i=0; i < data.length; i++) {
	  gameID=data[i][0];
	  user1Name=data[i][1];
		if(document.getElementById(gameID))
		{
		}
		else
		{
		var newRow = $("<tr id='"+gameID+"'><td>"+gameID+"</td><td>"+user1Name+"</td><td><a href='/games/new."+gameID+"' class='btn btn-small btn-primary'>Join</a></td></tr>");
		   $("#showTable").append(newRow);
		}

	};
	
}
function hide(id){
	var div = $("#"+id);
	div.hide();
}
function display (index) {
	  if(turn && started){
	  	if(user==1){
	  		document.getElementById("e"+index).innerHTML="X";
	  	}else{
	  		document.getElementById("e"+index).innerHTML="O";
	  	}
	  	changes=false;
	  }
	}
