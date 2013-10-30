//function to add the row. Content is json object with fields:
//code(true is ok, false is not ok); company; typeName; price; days.
//table is jquery object of target table
var  addRow = function(content,table){
 	var row = "<tr>";
 	row += "<td><a href = '"+content.companyLink;
 	row += "'><img src = '" + content.image_url;
 	row += "'alt ='"+ content.companyName +"'/></a></td>";
 	row += "<td>"+content.typeName+"</td>";
 	row += "<td>"+content.price+"</td>";
 	row += "<td>"+content.days+"</td>";
 	row +="</tr>";
 	table.append(row);
};

var prepareParameters = function(params){
	var result = params.replace(new RegExp("&quot;", "g"),"'");
	result = result.replace(new RegExp("=&gt;", "g"),":");
	return(result);
}	
