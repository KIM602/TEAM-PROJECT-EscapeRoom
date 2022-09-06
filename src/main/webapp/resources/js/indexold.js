
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

// text typing
const content = "Welcome Escape Room"
const text = document.querySelector(".text");
let i = 0;

function typingT(){
    if(i < content.length) {
        let txt = content.charAt(i);
        text.innerHTML += txt;
        i++;
    }
}
setInterval(typingT, 200);