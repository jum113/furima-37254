document.addEventListener('DOMContentLoaded', function(){
  const form = document.getElementById('form');
  const previewList = document.getElementById('previews');

  if (!form) return null;

  const imageLimits = 5;

  // プレビュー画像を生成・表示する関数
  const buildPreviewImage = (dataIndex, blob) => {
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    const deleteButton = document.createElement('div');
    deleteButton.setAttribute('class', 'image-delete-button');
    deleteButton.innerText = '削除';

    deleteButton.addEventListener('click', () => deleteImage(dataIndex));

    previewWrapper.appendChild(previewImage);
    previewWrapper.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);
  };

  // file_fieldを生成・表示する関数
  const buildNewFileField = () => {
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'item[images][]');

    const lastFileField = document.querySelector('input[type="file"][name="item[images][]"]:last-child');
    const nextDataIndex = Number(lastFileField.getAttribute('data-index')) +1;
    newFileField.setAttribute('data-index', nextDataIndex);

    newFileField.addEventListener('change', changedFileField);

    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  };

  // 指定したdata-indexを持つプレビューとfile_fieldを削除する
  const deleteImage = (dataIndex) => {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    deletePreviewImage.remove();
    const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
    deleteFileField.remove();

    const imageCount = document.querySelectorAll('.preview').length;
    if (imageCount == imageLimits - 1) buildNewFileField();
  };

  // input要素の値の変化が起きた際に呼び出される関数の中身
  const changedFileField = (e) => {
    const dataIndex = e.target.getAttribute('data-index');
    const file = e.target.files[0];

    if (!file) {
      deleteImage(dataIndex);
      return null;
    };

    const blob = window.URL.createObjectURL(file);

    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);

    if (alreadyPreview) {
      const alreadyPreviewImage = alreadyPreview.querySelector('img');
      alreadyPreviewImage.setAttribute('src', blob);
      return null;
    };

    buildPreviewImage(dataIndex, blob);

    const imageCount = document.querySelectorAll('.preview').length;
    if (imageCount < imageLimits) buildNewFileField();
  };

  const fileField = document.querySelector('input[type="file"][name="item[images][]"]');

  fileField.addEventListener('change', changedFileField);
});