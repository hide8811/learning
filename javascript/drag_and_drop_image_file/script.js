const dropZone = document.getElementById('drop-zone');
const inputFile = document.getElementById('input-file');
const previewZone = document.getElementById('preview-zone');
const cancelBtn = document.getElementById('cancel-btn');

const addPreview = (file) => {
  const src = window.URL.createObjectURL(file);

  previewZone.innerHTML = `<img class="preview-img" src="${src}">`;
  dropZone.classList.add('hide');
};

const removePreview = () => {
  previewZone.innerHTML = '';
  dropZone.classList.remove('hide');
};

// `dragover`のイベントを`preventDefault();`でキャンセルしないと、
// ファイルがブラウザで展開されてしまい、`drop`イベントが起きない。
dropZone.addEventListener('dragover', (event) => {
  event.preventDefault();
  dropZone.style.backgroundColor = '#dcdddd';
});

dropZone.addEventListener('dragleave', () => {
  dropZone.style.backgroundColor = '';
});

dropZone.addEventListener('drop', (event) => {
  // 上記`dragover`のときと同じ。
  event.preventDefault();

  // `FileList`を取得している。
  // [FileList](https://developer.mozilla.org/ja/docs/Web/API/FileList)
  const dropFiles = event.dataTransfer.files;

  if (dropFiles.length > 1) {
    alert('ファイルは一つだけです');
    return;
  }

  inputFile.files = dropFiles;
  addPreview(dropFiles[0]);
});

inputFile.addEventListener('change', () => {
  const imageFiles = inputFile.files;

  if (imageFiles.length === 0) {
    removePreview();
  } else {
    addPreview(imageFiles[0]);
  }
});

dropZone.addEventListener('click', () => {
  inputFile.click();
});

cancelBtn.addEventListener('click', () => {
  inputFile.value = '';
  removePreview();
});
