document.addEventListener('DOMContentLoaded', function(){
  const form = document.getElementById('form');
  console.log(form)
  const previewList = document.getElementById('previews');
  console.log(previewList)
  if (!form) return null;
  console.log("preview.jsが読み込まれました")

  const fileField = document.querySelector('input[type="file"][name="item[image]"]');
  console.log(fileField)
  fileField.addEventListener('change', function(e){
    const alreadyPreview = document.querySelector('.preview');
    console.log(alreadyPreview)
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    console.log("input要素で値の変化が起きました")
    const file = e.target.files[0];
    console.log(file)
    const blob = window.URL.createObjectURL(file);
    console.log(blob)

    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    console.log(previewWrapper)

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    console.log(previewImage)

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});