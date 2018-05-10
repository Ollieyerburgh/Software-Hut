$( document ).on('turbolinks:load', function() {

    $(".col-md-8.col-centered.flex").click(function() {
        window.location = $(this).data("link");
    });

});

$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
});
