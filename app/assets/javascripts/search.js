$( document ).on('turbolinks:load', function() {
    $(".like-btn").click(function() {
        event.stopPropagation();

        var url = $(this).attr('href');
        alert(url);
        $.ajax({
            url: url,
            type: 'PUT',
            headers: {
                "Content-Type": "application/json"
            },            
            success: function(result) {
                // Do something with the result
                alert(result);
            },
        error: function(xhr, textStatus, error){
            console.log(xhr.statusText);
            console.log(textStatus);
            console.log(error);
        }
        });

        return false;

    });

    $(".clickonly").click(function() {
        window.location = $(this).data("link");
    });

    if ($('.irs').length==0) {
        $("#example_id").ionRangeSlider({
            min: '0',
            max: '1400'
        });
    }
    

    
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


        if (document.getElementById("postcode_value")) {
            var postcode = document.getElementById("postcode_value").value;
            if (postcode != null) {
                document.getElementById("postcode").value = postcode;
            }
        }

        var e = document.getElementById("query").value;
        if (e=='') {
            e.id='notquery';
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
