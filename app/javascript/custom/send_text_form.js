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

function confirmSubmission() {
    let fake_name = names[Math.floor(Math.random() * names.length)];
    let textBox = getTextBox()
    let raw_message = textBox.val();
    let example_message = raw_message.replace("{FIRSTNAME}", fake_name)
    console.log("Message is: " + example_message)
    $("#modal-message").text(example_message)
    
    var recipient_ids = [];
    let recipient_name_list = $("#recipient-list")

    $.each($("input[name='recipient[ids][]']:checked"), function(){
        recipient_ids.push($(this).val());
        let current_name = $(this).parent().text().trim()
        console.log(current_name)
        var li = $("<li/>")
        $(li).text(current_name)
        $(li).appendTo(recipient_name_list)
        });
    $(".modal").removeClass('fade')
    $(".modal").show()

    
}

function submitForm(message, recipient_ids) {
    $(form).submit()
}

function addHandlers() {
    $("#first_name_button").click(insertFirstName);
    $("#submitBtn").on("click", confirmSubmission)
}

$(document).ready(function(){
    addHandlers()
    }
)

