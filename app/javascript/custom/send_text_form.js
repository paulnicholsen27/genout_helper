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
        var li = $("<li/>")
        $(li).text(current_name)
        $(li).appendTo(recipient_name_list)
        });
    $(".modal").removeClass('fade').show()
}

function submitForm(e) {
    console.log('what what')
    e.preventDefault()
    $("form").submit()
}

function hideModal() {
    $(".modal").addClass('fade').hide()
}

function addHandlers() {
    $("#first_name_button").click(insertFirstName);
    $("#submitBtn").on("click", confirmSubmission)
    $("#modal-submit").on("click", submitForm)
    $("#modal-cancel").on("click", hideModal)
}

$(document).ready(function(){
    addHandlers()
    }
)

