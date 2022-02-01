// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';

import { initForm, initCalendar, displayPaymentMethod } from '../components/form.js'
import { initFlow } from '../components/flow.js'
import { initBraintree } from '../components/braintree.js'
import { initBadge } from '../components/badge.js'
import { initMapBox } from "../components/mapbox.js";
import { initAlgolia } from "../components/algolia.js";
import { initSearch } from "../components/search.js";
import { initStatus } from "../components/status.js";
// import { formatSchema } from "webpack/lib/WebpackOptionsValidationError";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  initForm();
  initFlow();
  initBadge();
  initMapBox();
  initAlgolia();
  initBraintree();
  initCalendar();
  initSearch();
  initStatus();
  displayPaymentMethod();
})
