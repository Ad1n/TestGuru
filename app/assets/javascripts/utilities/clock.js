// JS clock. Maybe add in future = )
$( document ).on('turbolinks:load', function() {
    if ($('#Clock').length > 0) {
        setTimeout(timer, 1000);
    };
});

function timer() {
    var d = new Date();
    $("#Clock")[0].innerHTML = d.toLocaleTimeString();
    setTimeout(timer, 1000);
};
