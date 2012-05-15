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
			var gameID=data[j][0];
	  		gout=true;
	  		var isWatch=data[j][3];
	  		if(!isWatch){
	  			document.getElementById("td"+gameID).innerHTML ="<a href='/games/join?id="+gameID+"' class='test btn btn-small btn-primary'>Join</a>"
			}else{
				document.getElementById("td"+gameID).innerHTML ="<a href='/games/watch?id="+gameID+"' class='test btn btn-small btn-success'>Watch</a>"
				try{
				document.getElementById("u2"+gameID).innerHTML =""+data[j][2];
				}catch (err){
					
				}
			}
		}
	  };
	  if(!gout){
	  	hide(idArr[i]);
	  }
	};
	for (var i=0; i < data.length; i++) {
	  user1Name=data[i][1];
	  user2Name=data[i][2];
	  var gameID=data[i][0];
	  	//true == watch else join data[i][2]
		if(document.getElementById(gameID))
		{
		}
		else
		{
			if(!data[i][3]){
				var newRow = $("<tr id='"+gameID+"'><td>"+gameID+"</td><td>"+user1Name+"</td><td id='u2"+gameID+"'></td><td id='td"+gameID+"'><a href='/games/join?id="+gameID+"' class='test btn btn-small btn-primary'>Join</a></td></tr>");
		   		$("#showTable").append(newRow);
			}else{
				var newRow = $("<tr id='"+gameID+"'><td>"+gameID+"</td><td>"+user1Name+"</td><td id='u2"+gameID+"'>"+user2Name+"</td><td id='td"+gameID+"'><a href='/games/watch?id="+gameID+"' class='test btn btn-small btn-success'>Watch</a></td></tr>");
		   $("#showTable").append(newRow);
			}
		}

	};
	
}
function hide(id){
	var div = $("#"+id);
	div.hide();
}
function display (gameid,index) {
	  if(turn && started && !gameEnded){
		if(document.getElementById("e"+index).innerHTML==""){  	
		  	if(user==1){
		  		document.getElementById("e"+index).innerHTML="X";
		  		$.getJSON('/games/play.json', {'game':gameid, 'index':index, 'data':'X'}, function(data)
				{
				    confirm(data);
					if(data=="X_Win"){
						gameEnded=true;
						document.getElementById("result").innerHTML="You won";
					}else if(data=="O_Win"){
						gameEnded=true;
						document.getElementById("result").innerHTML="You Lost";
					}else if(data=="Draw"){
						gameEnded=true;
						document.getElementById("result").innerHTML="Game Draw";
					}
				});
		  	}else{
		  		document.getElementById("e"+index).innerHTML="O";
		  		$.getJSON('/games/play.json', {'game':gameid, 'index':index, 'data':'O'}, function(data)
				{
				    confirm(data);
					if(data=="X_Win"){
						gameEnded=true;
						document.getElementById("result").innerHTML="You lost";
					}else if(data=="O_Win"){
						gameEnded=true;
						document.getElementById("result").innerHTML="You won";
					}else if(data=="Draw"){
						gameEnded=true;
						document.getElementById("result").innerHTML="Game Draw";
					}
				});
		  	}
	  	board[index-1]=1;
	  	}
		turn=false;
	  	// changes=false;
	  }
	}
	
	function close()
	{
        $.post('/games/close');
	}
