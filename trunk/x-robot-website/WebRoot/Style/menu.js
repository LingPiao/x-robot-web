/* …œ∑Ω≤Àµ• */
function switchTab(tabpage,tabid){
var oItem = document.getElementById(tabpage).getElementsByTagName("li"); 
    for(var i=0; i<oItem.length; i++){
        var x = oItem[i];    
        x.className = "";
}
	document.getElementById(tabid).className = "Selected";
	var dvs=document.getElementById("cnt").getElementsByTagName("div");
	for (var i=0;i<dvs.length;i++){
	  if (dvs[i].id==('d'+tabid))
		  dvs[i].style.display='block';
	  else
		  dvs[i].style.display='none';
	}
}
