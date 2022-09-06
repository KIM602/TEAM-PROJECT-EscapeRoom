//nav button
let navHam = 0
$(".hamburger").click(function(e){
    navHam = !navHam
    e.preventDefault()
    
    // delay안되서 보류
    // if(navHam){
    //     $(".nav-wrap").css({height:'100%'})
    // }else{
    //     $(".nav-wrap").css({height:'0'})
    // }

    //nav animate 
    if(navHam){
        $(".nav-wrap").animate({"height":"100%"},500)
    }
    else{
        $(".nav-wrap").animate({"height":"0"},500)
    }
})

function navButton(Btn) {
    Btn.classList.toggle("change");
}