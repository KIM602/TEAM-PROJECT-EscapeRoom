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

// mouse control
window.addEventListener("wheel",function(e){
    e.preventDefault();
},{passive:false});

let htmlNum = $("html");
let page = 0;
let lastPage = $("section, footer").length;

htmlNum.animate({scrollTop:0},10)

$(window).on("wheel",function(e){
    if(htmlNum.is(":animated"))
        return;
    if(e.originalEvent.deltaY > 0){
        if(page == lastPage) return;
        page++;
    }
    else if(e.originalEvent.deltaY < 0){
        if(page == 1) return;
        page--;
    }
    let pageTop = (page - 1) * $(window).height();

    htmlNum.animate({scrollTop : pageTop});
});
