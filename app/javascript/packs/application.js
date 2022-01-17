// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';


import { initForm, calendar, displayPaymentMethod } from '../components/form.js'
import { initFlow } from '../components/flow.js'
import { address } from '../components/autocomplete.js'
import { brain } from '../components/braintree.js'
// import { formatSchema } from "webpack/lib/WebpackOptionsValidationError";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  initForm();
  initFlow();
  calendar();
  displayPaymentMethod();
  address();
  brain();

})
