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
  //New Comment for a Film - GET

  $('.new-comment-button').on('click', '.button', function(event) {
    event.preventDefault();
    $.ajax({
      method: 'GET',
      url: $(event.target).attr('href')
    }).then(function(response) {
      $('.new-comment-button').hide();
      $('.create-new-comment-container').append(response).hide().fadeIn(800);
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
      $('.create-new-comment-container').hide();
      $('.new-comment-button').show();
      $('.comment-listing').append(response).hide().fadeIn(800);
    });
  });

  //Delete for Film Comments

  $('.individual-comment').on('click', '.delete-comment', function(event) {
    event.preventDefault();
    debugger;
    $.ajax({
      method: "POST",
      url: $(event.target).attr('href'),
      dataType: "json",
      data: { _method: "delete"},
      complete: function() {
    debugger;
    $(event.target).closest('.individual-comment').fadeOut(300, function() { $(this).remove(); })
    }
  })
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


    //Change Opacity of Navbar on Mouse Over

    $('.top-bar').css('opacity', 0.5);

    $('.top-bar').hover(function() {
      $(this).animate({opacity: 1.0}, 500);
    }, function(event) {
      $(this).animate({opacity: 0.5}, 500);
    });

    //Set Timeout for flash message

    setTimeout(function() {
      $('.flash').fadeOut(800);
    }, 4000);


});
