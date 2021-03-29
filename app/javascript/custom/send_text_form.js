const names = ["Buffy", "Willow", "Giles", "Xander", "Spike", "Drusilla", "Dawn", "Tara", "Anya", "Cordelia", "Angel", "Joyce", "Harmony", "Glory", "Faith", "Riley", "Jesse"]

let getTextBox = () => {return $( "#message" ) }

let insertFirstName = (e) => {
    e.preventDefault()
    let textBox = getTextBox()

    var cursorPos = textBox.prop('selectionStart');
    var v = textBox.val();
    var textBefore = v.substring(0,  cursorPos);
    var textAfter  = v.substring(cursorPos, v.length);

    textBox.val(textBefore + "{FIRSTNAME}" + textAfter);

}

function confirmSubmission(e) {
    e.preventDefault()
    let name = names[Math.floor(Math.random() * names.length)];
    let textBox = getTextBox()
    let raw_message = textBox.val();
    let formatted_message = raw_message.replace("{FIRSTNAME}", name)
    if(!confirm("Your message is: \n" + formatted_message + "\nDoes this look OK?")) {
        return false;
      }
    this.submit()
}

function addHandlers() {
    $("#first_name_button").on("click", insertFirstName);
    $("#send-text-form").on("submit", confirmSubmission)
}

$(document).ready(function(){
    addHandlers()
    }
)

