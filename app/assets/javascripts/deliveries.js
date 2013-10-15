//function to add the row. Content is json object with fields:
//code(true is ok, false is not ok); company; typeName; price; days.
//table is jquery object of target table
var  add_row = function(content,table){
 	var row = "<tr>";
 	row += "<td><a href='"+content.companyLink+"'>"+content.companyName+"</a></td>";
 	console.log(row);
 	row += "<td>"+content.typeName+"</td>";
 	row += "<td>"+content.price+"</td>";
 	row += "<td>"+content.days+"</td>";
 	row +="</tr>";
 	table.append(row);
};