$(function(){
		$(".channels").click(function(){
			$(".channels").each(function(){
				$(this).next().removeClass("show");
				$(this).next().addClass("hide");
				
				$(this).find("span").removeClass("active");
				$(this).find("span").addClass("no-hover");
			});
						
			if(!$(this).find("span").hasClass("active")){
				$(this).find("span").addClass("active");
				$(this).find("span").removeClass("no-hover");
			}
			
			if($(this).next().hasClass("hide")){
				$(this).next().removeClass("hide");
				$(this).next().addClass("show");
			}
		});
				
		$(".popover-close-btn").click(function(){
			if($(this).parents(".custom-popover").prev().find("span").hasClass("active")){
				$(this).parents(".custom-popover").prev().find("span").removeClass("active");
				$(this).parents(".custom-popover").prev().find("span").addClass("no-hover");
			}
			
			if($(this).parents(".custom-popover").hasClass("show")){
				$(this).parents(".custom-popover").removeClass("show");
				$(this).parents(".custom-popover").addClass("hide");
			}
		});
	});