const names = ["Buffy", "Willow", "Giles", "Xander", "Spike", "Drusilla", "Dawn", "Tara", "Anya", "Cordelia", "Angel", "Joyce", "Harmony", "Glory", "Faith", "Riley", "Jesse"]

let getTextBox = () => {return $( "#message" ) }

let insertFirstName = (e) => {
    e.preventDefault()
    let textBox = getTextBox()

    var cursorPos = textBox.prop('selectionStart');
    // debugger
    var v = textBox.val();
    var textBefore = v.substring(0,  cursorPos);
    var textAfter  = v.substring(cursorPos, v.length);
    let textToInsert = "{FIRSTNAME} "
    textBox.val(textBefore + textToInsert + textAfter);
    cursorPos += textToInsert.length
    textBox.focus();
    textBox[0].setSelectionRange(cursorPos, cursorPos);
}

function confirmSubmission() {
    let fake_name = names[Math.floor(Math.random() * names.length)];
    let textBox = getTextBox()
    let raw_message = textBox.val();
    let example_message = raw_message.replace("{FIRSTNAME}", fake_name)
    $("#modal-message").text(example_message)
    
    var recipient_ids = [];

    let recipient_name_list = $("#recipient-list")
    recipient_name_list.html("")
    $.each($("input[name='recipient[ids][]']:checked"), function(){
        recipient_ids.push($(this).val());
        let current_name = $(this).parent().text().trim()
        var li = $("<li/>")
        $(li).text(current_name)
        $(li).appendTo(recipient_name_list)
        });
    if (!(raw_message && recipient_ids.length)) {
        alert("You must provide a message and at least one recipient")
        return false
    }
    $(".modal").removeClass('fade').show()
    $("#send-text-form").addClass('blur')

}

function submitForm(e) {
    e.preventDefault()
    $("form").submit()
}

function hideModal() {
    $(".modal").addClass('fade').hide()
    $("#send-text-form").removeClass('blur')
}

function toggleSelectAll(){
    $('input:checkbox').not("#toggle-inactive,:hidden").prop('checked', this.checked);
}

function toggleInactive(){
    $(".inactive .singer").prop('checked', false)
    $(".inactive").toggle()
}

function setUpPage() {
    $("#first_name_button").on("click", insertFirstName);
    $("#submitBtn").on("click", confirmSubmission)
    $("#modal-submit").on("click", submitForm)
    $("#modal-cancel").on("click", hideModal)
    $("#select-all").on('click', toggleSelectAll)
    $("#toggle-inactive").on('click', toggleInactive)
}

$(document).on('turbolinks:load', setUpPage);
