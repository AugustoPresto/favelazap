import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.multiple').select2({
    placeholder: 'Select an option'
  }); // (~ document.querySelectorAll)
};

export { initSelect2 };
