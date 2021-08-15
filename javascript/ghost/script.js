const ghorst = document.getElementById('ghorst');
const hideBtn = document.getElementById('hide-btn');
const appear = document.getElementById('appear-btn');

const ghorstHide = () => {
  ghorst.classList.remove('appear');
  ghorst.classList.add('hide');
};

const ghorstAppear = () => {
  ghorst.classList.remove('hide');
  ghorst.classList.add('appear');
};

hideBtn.addEventListener('click', ghorstHide);
appear.addEventListener('click', ghorstAppear);
