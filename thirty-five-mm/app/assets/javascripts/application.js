// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $("#categories-index-container").hide();

  $(".button_to").on("submit", function(event){
    event.preventDefault();
    $("#categories-index-container").fadeIn(400).show();
    // $("#bgvid").css()
    $("#video-container").slideUp(700, function(){$("#video-container").remove();});
    $("#categories-index-container").fadeIn(400).show();
    // $("#bgvid").slideUp("slow", function(){});
    // $("#bgvid").fadeOut(700, function(){$("#bgvid").remove();});
  })

  $('.new-comment-button').on('click', '.button', function(event) {
    event.preventDefault();
    $.ajax({
      method: 'GET',
      url: $(event.target).attr('href')
    }).then(function(response) {
      $(event.target).hide();
      $('.create-new-comment-container').append(response);
    });
  });

  $('.create-new-comment-container').on('submit', '.new_comment', function(event) {
    event.preventDefault();
    $.ajax({
      method: 'POST',
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()
    }).then(function(response) {
      $(event.target).hide();
      $('.new-comment-header').hide();
      $('.comment-listing').append(response);
    });
  });

  $('.comment-listing-container').on('click', '.delete-comment-button', function(event) {
    event.preventDefault();

    $.ajax({
      type: "post",
      url: $(event.target).attr('href'),
      data: {"_method": "delete"}
    });
  });
});
