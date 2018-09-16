document.addEventListener('turbolinks:load', function() {

    // Check class .progress-bar in the document
    var $control = $('.progress-bar').length;
    // If it take place change css - color by percentages
    if ($control > 0) {
        $('#progressBar').css('width', setInterval);
    }

});

function setInterval() {
    // Function return attribute-data , which set in show.html.erb div class => data-progress="..."
    return document.getElementById("progressBar").getAttribute('data-progress') + '%';

}