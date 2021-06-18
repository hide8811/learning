// alert
const alertButton = document.getElementById('alert');

alertButton.addEventListener('click', () => {
  alert('警告');
});

// promt
const promtButton = document.getElementById('promt');
const contentAcqusition = document.getElementById('content_acqusition');

promtButton.addEventListener('click', () => {
  const inputContent = prompt('入力');

  contentAcqusition.insertAdjacentHTML('beforeend', inputContent);
});

// confirm
const confirmButton = document.getElementById('confirm');

confirmButton.addEventListener('click', () => {
  window.confirm('確認');
});
