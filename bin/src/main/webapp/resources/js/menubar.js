//nav button
let navHam = 0
$(".hamburger").click(function(e){
    navHam = !navHam
    e.preventDefault()
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
