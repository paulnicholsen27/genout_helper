
let getTextBox = () => {return $( "#message" ) }

let insertFirstName = () => {
    let textBox = getTextBox()

    var cursorPos = textBox.prop('selectionStart');
    var v = textBox.val();
    var textBefore = v.substring(0,  cursorPos);
    var textAfter  = v.substring(cursorPos, v.length);

    textBox.val(textBefore + "{FIRSTNAME}" + textAfter);

}



function addHandlers() {
    $( "#first_name_button" ).click(insertFirstName);
}

$(document).ready(function(){
    addHandlers()
    }
)

