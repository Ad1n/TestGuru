$(document).on('turbolinks:load', function() {
    // Check timer for presence
    if ($('#Timer').length > 0 && $('#Timer-presence')[0].innerHTML == "true") {
        // Create storages for sending values to the next page of test
        seconds = localStorage.seconds;
        hours = localStorage.hours;
        minutes = localStorage.minutes;

        // If undefined - read values from field "Timer-seconds" in show.html.erb
        if (typeof(hours) == 'undefined' || typeof(minutes) == 'undefined' || typeof(seconds) == 'undefined' ||
            typeof(hours) == 'NaN' || typeof(minutes) == 'NaN' || typeof(seconds) == 'NaN') {
            seconds = parseInt($('#Timer-seconds')[0].innerHTML);
            hours = parseInt($('#Timer-hours')[0].innerHTML);
            minutes = parseInt($('#Timer-minutes')[0].innerHTML);
        }

        setTimeout(timer, 1000);
    } else {
        localStorage.clear()
    };
});

function timer() {

    // Get data-attribute with test_passage identificator
    var test_passage_id = $('#Form-tp')[0].getAttribute('data-test-passage-id');

    if (seconds == 0) {
        if (minutes == 0) {
            if (hours == 0) {
                localStorage.clear();
                // When timer stops redirect to result
                window.location.replace(test_passage_id + "/result");
                return;
            } else {
                hours--;
                minutes = 59;
            }
        } else {
            minutes--;
            seconds = 59;
        }
    } else {
        seconds--;
    }

    // Save vars in storage
    localStorage.seconds = seconds;
    localStorage.hours = hours;
    localStorage.minutes = minutes;

    // Output timer
    $('#Timer')[0].innerHTML = hours + "h " + minutes + "m " + seconds + "s";

    if ($('#Timer').length > 0 && $('#Timer-presence')[0].innerHTML == "true") {
        setTimeout(timer, 1000)
    };
};
