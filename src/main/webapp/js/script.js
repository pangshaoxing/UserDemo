$(document).ready(function(){
	var type='';
	var price=0;
	$("#select1 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectA").remove();
		} else {
			var copyThisA = $(this).clone();
			if ($("#selectA").length > 0) {
				var aa = $("#selectA a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisA.attr("id", "selectA"));
				type = $(this).text();
				
				select();
			}
		}
	});
	
	$("#select2 dd").click(function () {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			var copyThisB = $(this).clone();
			if ($("#selectB").length > 0) {
				$("#selectB a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisB.attr("id", "selectB"));
				price = $(this).text();
				select();
			}
		}
	});
	
	$("#selectA").live("click", function () {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$("#selectB").live("click", function () {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	$("#selectC").live("click", function () {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
	});
	
	
	$(".select dd").live("click", function () {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
		} else {
			$(".select-no").show();
		}
	});
	
	function select(){
		var chemical = {"chemicalName":type,"chemicalPrice":price};
		$.ajax({  
               type: "GET",  
               async:true,  
               url: "chemicalInfoSelect.action",    //必须是后台的静态方法  
               contentType: "application/json; charset=utf-8",  
               dataType: "json",  
               data:chemical,  
               success: function (data) {  
            	   if(data!=null){
            		   for(var i = 0;i<data.length;i++){
            			   var bigImg = document.createElement("img");     //创建一个img元素  
                	       bigImg.src = data[i].picturePath;   //给img元素的src属性赋值  
                	       bigImg.width = 100;
                	       bigImg.height = 100;
    						$("#content").append("chemicalName:")
    									 .append(data[i].chemicalName)
    									 .append("<br>")
    									 .append("chemicalPrice:")
    									 .append(data[i].chemicalPrice)
    									 .append("<br>")
    									 .append("chemicalSales:")
    									 .append(data[i].chemicalSales)
    						 			 .append("<br>")
    						 			 .append(bigImg);
            		   }
					}else{
						$("#content").html("无内容！");
					}
               }                
           }); 
	}
	
});