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
    $("#bgvid").css("position", "absolute")
    $("#bgvid").fadeOut(400)
    $("#main-content").css("position", "absolute");
    $("#categories-index-container").show();
    // $("#categories-index-container").scrollTop(0);
    $("body").scrollTop(1000);
  });


  //New Comment for a Film - GET

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

  //New Comment for a Film - POST

  $('.create-new-comment-container').on('submit', '.new_comment', function(event) {
    event.preventDefault();
    $.ajax({
      method: 'POST',
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()
    }).then(function(response) {
      $(event.target).hide();
      $('.new-comment-header').hide();
      $('.new-comment-button').show();
      $('.comment-listing').append(response);
    });
  });

  //Delete for Film Comments

  $('.comment-listing-container').on('click', '.delete-comment-button', function(event) {
    event.preventDefault();
    $.ajax({
      type: "post",
      url: $(event.target).attr('href'),
      data: { _method: "delete"}
    });
    $(event.target).closest('.individual-comment').hide();
  });

  //Add to Review Comments

  $('#review-comments-container').on('click', '.create-new-review-comment-button', function(event) {
    event.preventDefault();
    $.ajax({
      method: 'GET',
      url: $(event.target).attr('href')
    }).then(function(response) {
      $(event.target).hide();
      $('.create-new-review-comment-container').append(response);
    });
  });


  $('#review-comments-container').on('submit', '.new_comment', function(event) {
    event.preventDefault();
    $(event.target).hide();
    $('.new-comment-header').hide();
    $.ajax({
      method: 'POST',
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()
    }).then(function(response) {
      $('.review-comment-listing').prepend(response);
      $('.create-new-review-comment-button').show();
    });
  });

    $('.review-comment-listing').on('click', '.delete-comment-button', function(event) {
      event.preventDefault();
      $.ajax({
        type: "post",
        url: $(event.target).attr('href'),
        data: { _method: "delete"}
      });
      $(event.target).closest('.individual-comment').hide();
    });


    $('.new-review-button').on('click', function(event){
      event.preventDefault();
        $(event.target).hide();
      $.ajax({
        url: $(event.target).attr('href')
      }).then(function(response){
        $('.section-title').append(response);
      })
    })

    $('.section-title').on('submit', 'review-form-container', function(event){
      event.preventDefault();
      debugger
      $('.review-form-container').hide();
    })

    // left off here


    //Change Opacity of Navbar on Mouse Over

    $('.top-bar').css('opacity', 0.5);

    $('.top-bar').hover(function() {
      $(this).animate({opacity: 1.0}, 500);
    }, function(event) {
      $(this).animate({opacity: 0.5}, 500);
    });


});
