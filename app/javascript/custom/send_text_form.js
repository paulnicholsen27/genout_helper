
let loaded = () => {
    console.log("loaded")
}

function myAlert() {
    alert ("My Message")
}

function addHandlers() {
    $( "#do-it" ).click(loaded);
}

$(document).ready(function(){
    console.log("ready")
    addHandlers()
    }
)