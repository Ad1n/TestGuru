document.addEventListener('turbolinks:load', function () {

    // *** STYLE USE JS VANILLA ***
    // var controls = document.querySelectorAll('.form-inline-link');
    // if (controls.length) {
    //     for (var i = 0; i < controls.length ; i ++) {
    //         controls[i].addEventListener('click', formInlineLinkHandler);
    //     }
    // }

    // *** STYLE USE Jquery ***
    var $control = $('.form-inline-link').length;

    if ($control > 0) {

        $('.form-inline-link').on('click', formInlineLinkHandler);

        var errors = document.querySelector('.ressource-errors');

        if (errors) {
            var ressourceId = errors.dataset.ressourceId;
            formInLineHandler(ressourceId);
        }
    }
});

function formInlineLinkHandler(event) {
    // Disable default behavior when we click "edit"
    event.preventDefault();

    // Get data attribute value
    var testId = this.dataset.testId;

    formInLineHandler(testId);
}

function formInLineHandler(testId) {
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
    // var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]');
    // var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]');

    var $testTitle = $('.test-title[data-test-id="' + testId + '"]');
    var $formInline = $('.form-inline[data-test-id="' + testId + '"]');


    // *** STYLE USE JS VANILLA ***
    // if (formInline.classList.contains('hide')) {
    //     testTitle.classList.add('hide');
    //     formInline.classList.remove('hide');
    //     link.textContent = 'Cancel';
    //
    // } else {
    //     testTitle.classList.remove('hide');
    //     formInline.classList.add('hide');
    //     link.textContent = 'Edit';
    // }


    // Jquery Style
    // Auto hide and show for element
    $formInline.toggle();
    $testTitle.toggle();

    if ($formInline.is(':visible')) {
        link.textContent = 'Cancel'
    } else {
        link.textContent = 'Edit'
    }

}