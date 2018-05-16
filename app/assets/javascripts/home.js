//This file is used for the javascript home page search functionality.


$( document ).on('turbolinks:load', function() {

    $(".col-md-8.col-centered.flex").click(function() {
        window.location = $(this).data("link");
    });

});

$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
});
