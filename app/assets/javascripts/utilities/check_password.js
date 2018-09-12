document.addEventListener('turbolinks:load', function() {

    // Find div with class password-checker
    var control = document.querySelector('.password-checker')
    //Find div conf-pass-check
    var confField = control.querySelector('.conf-pass-check')

    // Add listener for this div element
    if (confField) { confField.addEventListener('input', passChecker) }
})

function passChecker() {

    // Value of password field
    var passFieldValue = document.getElementById('passCheck').value
    // Value of confirmation password field
    var confPassFieldValue = document.getElementById('confPassCheck').value

    if (confPassFieldValue != passFieldValue) {
        document.querySelector('.passwordCheck').classList.add('wrong-field')
        document.querySelector('.passwordCheck').classList.remove('correct-field')
        // Octicon image remove class hide for showing success status
        this.querySelector('.octicon-check').classList.add('hide')

    }   else {
        document.querySelector('.passwordCheck').classList.remove('wrong-field')
        document.querySelector('.passwordCheck').classList.add('correct-field')
        this.querySelector('.octicon-check').classList.remove('hide')
    }

    // If fields empty remove any checks from fields
    if (passFieldValue == "" || confPassFieldValue == "") {
        document.querySelector('.passwordCheck').classList.remove('correct-field')
        document.querySelector('.passwordCheck').classList.remove('wrong-field')
        this.querySelector('.octicon-check').classList.add('hide')
    }
}