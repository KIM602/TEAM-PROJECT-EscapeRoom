$(".nav-list").on("click",function(){
    $(".nav-sublist").show(500);
});
$(".nav-sublist").on("click",function(){
    $(".nav-lastlist",this).toggle(500);
});