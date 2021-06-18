// 表示切り替え
const inputTypeChange = (field, icon) => {
  if (field.type === 'password') {
    field.type = 'text';
    icon.innerHTML = '<i class="fas fa-eye-slash"></i>';
  } else {
    field.type = 'password';
    icon.innerHTML = '<i class="fas fa-eye"></i>';
  }
};

const passwordTypeChange = document.getElementById('password-type_change');
const confirmPasswordTypeChange = document.getElementById('confirm_password-type_change');

passwordTypeChange.addEventListener('click', () => {
  const password = document.getElementById('password');

  inputTypeChange(password, passwordTypeChange);
});

confirmPasswordTypeChange.addEventListener('click', () => {
  const confirmPassowrd = document.getElementById('confirm_password');

  inputTypeChange(confirmPassowrd, confirmPasswordTypeChange);
});

// セキュリティ強度
const pass = document.getElementById('password');
const security = document.getElementById('security');

pass.addEventListener('input', () => {
  let securityPoint = 0;

  if (/[A-Z]/.test(pass.value)) securityPoint += 1;

  if (/[a-z]/.test(pass.value)) securityPoint += 1;

  if (/\d/.test(pass.value)) securityPoint += 1;

  if (/[!@#$%^&*\-=_+<>?]/.test(pass.value)) securityPoint += 1;

  if (securityPoint === 0) {
    security.innerHTML = `<i class="far fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>`;
  }

  if (securityPoint === 1) {
    security.innerHTML = `<i class="fas fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>`;
  }

  if (securityPoint === 2) {
    security.innerHTML = `<i class="fas fa-lightbulb"></i>
                                <i class="fas fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>`;
  }

  if (securityPoint === 3) {
    security.innerHTML = `<i class="fas fa-lightbulb"></i>
                                <i class="fas fa-lightbulb"></i>
                                <i class="fas fa-lightbulb"></i>
                                <i class="far fa-lightbulb"></i>`;
  }

  if (securityPoint === 4) {
    security.innerHTML = `<i class="fas fa-lightbulb"></i>
                                <i class="fas fa-lightbulb"></i>
                                <i class="fas fa-lightbulb"></i>
                                <i class="fas fa-lightbulb"></i>`;
  }
});

// 必須文字チェック
const password = document.getElementById('password');

password.addEventListener('input', function () {
  const alphabetUpperCase = document.getElementById('alphabet-upper_case');
  const alphabetLowerCase = document.getElementById('alphabet-lower_case');
  const number = document.getElementById('number');
  const symbol = document.getElementById('symbol');

  const gray = '#c0c6c9';
  const red = '#b7282e';

  // alphabet upper case
  alphabetUpperCase.style.color = (/[A-Z]/.test(this.value)) ? gray : red;

  // alphabet lower case
  alphabetLowerCase.style.color = (/[a-z]/.test(this.value)) ? gray : red;

  // number
  number.style.color = (/[\d]/.test(this.value)) ? gray : red;

  // symbol
  symbol.style.color = (/[!@#$%^&*\-=_+<>?]/.test(this.value)) ? gray : red;
});

const checkBtn = document.getElementById('password_check_btn');

checkBtn.addEventListener('click', () => {
  const password = document.getElementById('password');
  const confirmPassword = document.getElementById('confirm_password');
  const message = document.getElementById('message');

  if (password.value === '' && confirmPassword.value === '') {
    message.innerText = '入力してください。';
    return false;
  }

  if (password.value === '') {
    message.innerText = '"Password"を入力してください。';
    return false;
  }

  if (confirmPassword.value === '') {
    message.innerText = '"Confirm Password"を入力してください。';
    return false;
  }

  if (password.value === confirmPassword.value) {
    message.innerText = 'OK';
  } else {
    message.innerText = '"Password"と"Confirm Password"の\n値が違います。';
  }
});
