// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//location.reload();
window.onload=function(){
    if (document.getElementById('cntrec')) {
        let cntrecq = parseInt(document.getElementById('cntrec').innerHTML);
        for (let i = 1; i <= cntrecq; i++) {
                myTimer(i)
        }
    }
}
//
function myTimer(kkk) {
    if (document.getElementById(kkk)){
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
}