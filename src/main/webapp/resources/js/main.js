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