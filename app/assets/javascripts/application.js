// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require date
//= require google-analytics-turbolinks
//= require fullcalendar
//= require jquery_nested_form
//= require bootstrap-typeahead-rails
//= require bootstrap-slider
//= require bootstrap-material-design

// $(".enrollment-cal-hide").bind('change', function(){
//   alert('esdas');
//   if (this.checked){
//     alert('esdas');
//     $.ajax({
//       url: '/enrollments/'+this.value+'/toggle',
//       type: 'POST',
//       data: {"cal_hidden": this.checked}
//     });
//   }
//   else {
//     alert("no");
//   }
// });

$(document).on("ready page:change", function() {
    $('.tag-tooltip').tooltip();
});

var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substrRegex;
 
    // an array that will be populated with substring matches
    matches = [];
 
    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');
 
    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        // the typeahead jQuery plugin expects suggestions to a
        // JavaScript object, refer to typeahead docs for more info
        matches.push({ value: str });
      }
    });
 
    cb(matches);
  };
};

function minutesToTime(time) {
  return Math.floor(time/60) * 100 + (time % 60)
}
function formatTime(time) {
  if (time == 0 || time == 2400) {
    return "Midnight";
  }
  var result, pm;
  if (time >= 1300) {
    pm = true;
    time -= 1200;
  } else if (time >= 1200) {
    pm = true;
  } else {
    pm = false;
  }

  if (Math.floor(time/100) == 0) { //speical case, 12am.
    time += 1200;
  }
  result = Math.floor(time / 100) + ":" + (time % 100 < 10 ? "0" : "") + (time % 100) + (pm ? "PM" : "AM");
  return result;
}