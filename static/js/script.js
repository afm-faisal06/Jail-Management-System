const change = (num) => {
  if (num === 1) {
    document.querySelector(".change-schedule").style.display = "block";
    document.querySelector(".section-schedule").style.filter = "blur(5px)";
    document.querySelector(".section-schedule").style.backgroundColor =
      "#ffffff90";
  } else {
    document.querySelector(".change-schedule").style.display = "none";
    document.querySelector(".section-schedule").style.filter = "blur(0px)";
    document.querySelector(".section-schedule").style.backgroundColor = '';
  }
};

// const request = (num) => {
//   let form = document.querySelector('.form-' + num);
//   form.parentNode.removeChild(form);
// }
