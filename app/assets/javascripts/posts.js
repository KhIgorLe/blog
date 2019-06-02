$(document).on('turbolinks:load', function () {
  $('.posts').on('click', '.edit-post-link', function (e) {
    e.preventDefault();
    $(this).hide();
    var postId = $(this).data('postId');
    $('form#edit-post-' + postId).removeClass('hidden');
  })

  $('.post').on('click', '.button-post-comment', function (e) {
    e.preventDefault();
    $(this).addClass('hidden');
    var postId = $(this).data('postId');
    $('form#Add-Post-Comment-' + postId ).removeClass('hidden');
  })
});
