$(document).on('turbolinks:load', function () {
  // 新規作成・編集画面で、file_fieldに選択した画像をプレビューで確認できるようにする
  function readURL(input) {
    let bodyPicId = '#' + input.id + '_prev';

    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $(bodyPicId).attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $('#user_icon, #header_image, #post_picture, #body_picture1, #body_picture2, #body_picture3').change(function () {
    readURL(this);
  });
});
