$(document).on('turbolinks:load', function () {
  $('.category').on('click', '.button-category-comment', function (e) {
    e.preventDefault();
    $(this).addClass('hidden');
    var categoryId = $(this).data('categoryId');
    $('form#Add-Category-Comment-' +categoryId ).removeClass('hidden');
  })
});
