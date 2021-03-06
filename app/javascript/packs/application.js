// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';

import { initFormBasket, initCalendarLine, displayPaymentMethod, initFormLine,
         initSize, initOption, capitalizeInputAll, capitalizeInputFirst
       } from '../components/form.js'
import { initFlow } from '../components/flow.js'
import { initBraintree } from '../components/braintree.js'
import { initBadge } from '../components/badge.js'
import { initMapBox } from "../components/mapbox.js";
import { initSearch } from "../components/search.js";
import { initStatusBasket } from "../components/status.js";
import { initActive } from "../components/active.js";
import { autocompleteAddress } from "../components/autocomplete_address.js";
import { rotate } from "../components/caret.js";
//import { test } from "@rails/webpacker/package/rules/babel";
//import { formatSchema } from "webpack/lib/WebpackOptionsValidationError";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  initFormBasket();
  initFormLine();
  autocompleteAddress();
  initFlow();
  initBadge();
  initMapBox("map");
  initMapBox("map2");
  initBraintree();
  initCalendarLine();
  initSearch();
  initStatusBasket();
  initActive();
  displayPaymentMethod();
  rotate("rotateable",".fa-angle-down",".target");
  initSize();
  initOption();
  capitalizeInputAll("address_surname");
  capitalizeInputAll("address_name");
  capitalizeInputAll("cake_name")
  capitalizeInputAll("form-city")
  capitalizeInputFirst("cake_description")
})
