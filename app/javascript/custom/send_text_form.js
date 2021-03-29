
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



function addHandlers() {
    $( "#first_name_button" ).on("click", insertFirstName);
}

$(document).on("ready", function(){
    addHandlers()
    }
)

