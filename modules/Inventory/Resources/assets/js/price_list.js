 $("#price_list1").validate({
    rules: {
      name: {
        required: true
      }
    },
    messages: {
      name:{
        required: "Please provide a name",
      }
    }
  });

 $(function(){
 	$(".priceList").click(function(){
 		if($(this).attr("data-id") == 2){ //2=>Individual Items
 			$(".pricing_scheme").removeAttr("style");
      $(".percentage").css("display","none");
      //$(".percentage1").css("display","none");

 		}else{
      //$(".percentage").css("display","block");
 			$(".pricing_scheme").hide();
      $(".percentage").css("display","block");
 		}
 	});
 })