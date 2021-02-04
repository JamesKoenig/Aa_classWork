const FollowToggle = require('./follow_toggle');

require('./follow_toggle');

//The callback should call your constructor once for each button.follow - toggle element.

//grab html elements, no jquery no js until everything is loaded;
//ready state function
//grab all buttons within followToggle class, iterating through all buttons;
//changing them to followToggle objects, now they can call all methods in that class
$(function() {
    $('button.follow-toggle').each(function(index,button){
        new FollowToggle(button); //turn all button into js objects
    })
})