import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("turbo:load", function (){
    let recs=document.querySelectorAll('span[class~="time"]');
    for (let i=0; i<recs.length; i++){
        myTimer(recs[i].id);
    }
})

function myTimer(kkk) {
    let timeSeconds = parseInt(document.getElementById(kkk).getAttribute("time"))
    let minute = Math.floor(timeSeconds % 3600 / 60)
    let hours = Math.floor(timeSeconds/3600)
    let sec = Math.round(timeSeconds % 3600 % 60)
    setInterval(function() {
        if (document.getElementById(kkk)){
            document.getElementById(kkk).innerHTML = hours + " : " + minute + " : " + sec;
            sec--;
            if (sec <= -1) {
                minute --;
                sec = 59;
                if (minute <= -1) {
                    hours--;
                    minute=59;
                }
            }
        }
    }, 1000);
}
