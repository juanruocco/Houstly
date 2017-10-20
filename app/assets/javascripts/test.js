//-----------------------------------------------------
// Initiate Thumbnail Slider (flexslider)
//-----------------------------------------------------

function themo_start_thumb_slider(id) {
    jQuery(id).flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: true,
        slideshow: false,
        itemWidth: 255,
        itemMargin: 40,
        maxItems: 4,
        prevText: '',
        nextText: '',
        start: function(){
            jQuery('.thumb-flex-slider .slides img').show();

        }
        //controlsContainer: '.flex-container'
        //useCSS: false
    });
}
