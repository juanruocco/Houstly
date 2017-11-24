"use strict";
/**
 * General Custom JS Functions
 *
 * @author     Themovation <themovation@gmail.com>
 * @copyright  2014 Themovation INC.
 * @license    http://themeforest.net/licenses/regular
 * @version    1.1
 */

/*
 # Helper Functions
 # On Window Resize
 # On Window Load
 */

//======================================================================
// Helper Functions
//======================================================================


//-----------------------------------------------------
// VERTICAL ALIGN ROOMS Meta Copy - Adds support for
// vertical alignment by detecting height of room boxes
// and setting container box height
//-----------------------------------------------------

function themo_vertical_align_room_thumb(){

    // Loop through all .float-block's
    jQuery( ".rooms-item" ).each(function() {

        //grab #parentID
        var parentID = jQuery( this ).closest("div").attr("id");
        //console.log("Parent ID is: "+parentID);

        jQuery("#"+parentID).css('height','auto');

        // Get height of #parentID .container
        var containerHeight = jQuery("#"+parentID+' .room-wrap').height();
        //console.log("Parent container height is: "+containerHeight);

        // Set #parentID height from .container
        jQuery("#"+parentID).height(containerHeight+'px');
        jQuery("#"+parentID + " .room-inner").height(containerHeight+'px');
        //console.log("Parent ID height is set at : "+containerHeight);

        //console.log("----------------------------");

    });

    jQuery(".room-center").css('visibility','visible');
}


//-----------------------------------------------------
// Adjust Padding for Transparent Header
// Need to adjust padding if transparent header is enabled,
// since we'll be using position: absolute and that will cause
// padding issues with the first page header or slider.
//-----------------------------------------------------

function themo_adjust_padding_transparent_header(elem){

    // Check if Transparency is enabled.
    if(jQuery('body').find('header.banner[data-transparent-header="true"]').length > 0) {

        // Get the height of the navigation header
        var headerHeight = parseInt(jQuery("header.banner").height());
        //console.log('DIGGITY DOG!');
        //console.log('Header Height '+headerHeight);

        // Adjust Padding for all sliders and page headers.



        //jQuery( "#main-flex-slider .themo_slider_0, section#themo_page_header_1" ).each(function() {
        jQuery( elem ).each(function() {
            // Get current padding
            var currentPadding = parseInt(jQuery(this).css("padding-top").replace(/[^-\d\.]/g, ''));
            //console.log('Current Padding '+currentPadding);

            // Calculate
            var newPadding = currentPadding+headerHeight;
            //console.log('New Padding '+newPadding);

            // Adjust and set new padding.
            jQuery(this).css({
                "padding-top":newPadding+"px"
            });

            //console.log("----------------------------");

        });

    };

}



//======================================================================
// On Window Load - executes when complete page is fully loaded, including all frames, objects and images
//======================================================================
$(window).on('load', function(){
    "use strict";



    // Adjust padding for transparent header
    themo_adjust_padding_transparent_header('section#themo_page_header_1');

    // Preloader for background images.
    var $header_preloader = jQuery(".full-header-img").parents(".preloader");

    //-----------------------------------------------------
    // Select all full header img classes and wait until images are loaded
    // before updating loading class to loaded
    //-----------------------------------------------------


    // Headhesive
    //var header = new Headhesive('.navbar-static-top');

    // Set options
    /*if(!isTouch){*/
        var options = {
            // Scroll offset. Accepts Number or "String" (for class/ID)
            offset: 125, // OR — offset: '.classToActivateAt',

            classes: {
                clone:   'headhesive--clone',
                stick:   'headhesive--stick',
                unstick: 'headhesive--unstick'
            }
        };

        try
        {
            // Initialise with options
            var banner = new Headhesive('.banner', options);
            jQuery('body').addClass('headhesive');
        }
        catch (err) {
            console.log('Sticky Header Off.');
        }
    /*}else{
        console.log('Sticky Header Off.');
    }*/


});
