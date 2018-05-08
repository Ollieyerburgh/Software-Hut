$( document ).ready(function() {
    $("#example_id").ionRangeSlider({
        min: '0',
        max: '1400'
    });
    $(".slickaroo").slick({
        dots: false,
        accessibility: false,
        autoplay: true,
        arrows: false,
        autoplaySpeed: 3000,
        vertical: true,
        slidesToShow: 3,
        slidesToScroll: 1,

    });

    $('#extra-filters').hide();

    $( "#more-filters" ).click(function() {
        if ( $('#extra-filters').is(':visible'))  {
            $('#extra-filters').hide();
            $("#more-filters p").text("+ Filters");
        } else {
            $('#extra-filters').show();
            $("#more-filters p").text("- Filters");

        }
    });

    $('#helloworld').submit(function(ev) {
        ev.preventDefault(); // to stop the form from submitting
        /* Validations go here */
        var slider = $("#example_id").data("ionRangeSlider");
        var distance_value = slider.result.from;
        document.getElementById("distance").value = distance_value;

        var postcode = document.getElementById("postcode_value").value;
        document.getElementById("postcode").value = postcode;

        var e = document.getElementById("query").value;
        if (e=='') {
            alert('Removing search');
            $('#query').remove();
        }

        var e = document.getElementById("selectsubject");
        var subject = e.options[e.selectedIndex].value;
        document.getElementById("subject").value = subject;
        if (subject=='Subject') {
            $('#subject').remove();
        }

        var e = document.getElementById("selecttheme");
        var subject = e.options[e.selectedIndex].value;
        document.getElementById("theme").value = subject;
        if (subject=='Theme') {
            $('#theme').remove();
        }

        var e = document.getElementById("selectdelivery");
        var subject = e.options[e.selectedIndex].value;
        document.getElementById("delivery").value = subject;
        if (subject=='Delivery method') {
            $('#delivery').remove();
        }

        this.submit(); // If all the validations succeeded
    });
});


