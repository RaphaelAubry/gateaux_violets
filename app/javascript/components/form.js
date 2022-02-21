import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"
import { clearPrewarmedResources } from "mapbox-gl";
import { initBraintree } from "./braintree";

const initFormBasket = () => {

  // get sources and targets
  const flow = document.getElementById("flow")
  const quantity = document.getElementById("line_quantity")
  const total = document.getElementById("total")
  const price = document.getElementById("price")

  if (quantity != null && total != null && price != null && flow != null){

    //check if there is already a quantity line in the database
    if (flow.dataset.id == ""){
        quantity.value = 1
    }
    // init total when page loads
    total.innerText = quantity.value * price.dataset.price;
    quantity.addEventListener('input', () => {
      // quantity x price = total
      total.innerHTML = quantity.value * price.dataset.price;
    })
  };
}

const initFormLine = () => {

   // get sources and targets
  const quantity = document.getElementById("line_quantity")
  const price = document.getElementById("price")
  const total = document.getElementById("total")

  if (quantity != null){
    // init total when page loads
    total.innerText = (quantity.value * price.dataset.price).toFixed(2) + " €";
    quantity.addEventListener('input', () => {
      // quantity x price = total
      total.innerText = (quantity.value * price.dataset.price).toFixed(2) + " €";
    })
  }
}

const initCalendarLine = () => {

  const date = document.getElementById("delivery_date")
  const dbdate = document.getElementById("dbdate")

  if (date != null) {

    const delivery_date = JSON.parse(dbdate.dataset.deliverydate);

    if (delivery_date != null) {

      console.log(delivery_date)
      const fp = flatpickr(date, {
        defaultDate: delivery_date,
        enableTime: true,
        dateFormat: "Le d/m/Y à H:i",
        "locale": French,
        minDate: minDeliveryDate(+(24 * 7)),
      });

    } else {

      const fp = flatpickr(date, {
        // defaultDate: delivery_date,
        enableTime: true,
        dateFormat: "Le d/m/Y à H:i",
        "locale": French,
        minDate: minDeliveryDate(+(24 * 7)),
      });

    }
  }
}

const minDeliveryDate = (notice) => {

  const date = new Date()
  date.setHours(notice + date.getHours())
  return date
}

const displayPaymentMethod = () => {

  const paymentType = document.querySelector("#paymentType")

  if ( paymentType != null ){

    const IBANDiv = document.querySelector(".IBAN")
    const cashDiv = document.querySelector(".Cash")
    const paypalDiv = document.querySelector(".Card")
    const IBANIcon = document.querySelector(".fa-server")
    const cashIcon = document.querySelector(".fa-money-bill-wave")
    const paypalIcon = document.querySelector(".fa-money-check")
    const manualPaymentDiv = document.querySelector(".manual-payment")
    const ePaymentDiv = document.querySelector(".e-payment")

    cashDiv.style.display = "none";
    paypalDiv.style.display = "none";
    cashIcon.style.display = "none";
    paypalIcon.style.display = "none";
    manualPaymentDiv.style.display = "";
    ePaymentDiv.style.display = "none";

    paymentType.addEventListener('change', () => {

    initBraintree()

    console.log("Display Payment Method: " + paymentType.options[paymentType.selectedIndex].value)

      switch (paymentType.options[paymentType.selectedIndex].value) {
        case "En espèces":
          IBANDiv.style.display = "none";
          cashDiv.style.display = "";
          paypalDiv.style.display = "none";
          IBANIcon.style.display = "none";
          cashIcon.style.display = "";
          paypalIcon.style.display = "none";
          manualPaymentDiv.style.display = "";
          ePaymentDiv.style.display = "none";
          break;
        case "Virement bancaire":
          IBANDiv.style.display = "";
          cashDiv.style.display = "none";
          paypalDiv.style.display = "none";
          IBANIcon.style.display = "";
          cashIcon.style.display = "none";
          paypalIcon.style.display = "none";
          manualPaymentDiv.style.display = "";
          ePaymentDiv.style.display = "none";
          break;
        case "Carte bancaire":
          IBANDiv.style.display = "none";
          cashDiv.style.display = "none";
          paypalDiv.style.display = "";
          IBANIcon.style.display = "none";
          cashIcon.style.display = "none";
          paypalIcon.style.display = "";
          manualPaymentDiv.style.display = "none";
          ePaymentDiv.style.display = "";
          break;
      }
    })
  }
}

const initSize = () => {

  //select all cards in an array
  const cards = document.querySelectorAll(".selectable")
  const borderPurple = "2px solid rgb(58, 22, 120)";
  const borderGreen = "2px solid #1EDD88";
  const input = document.getElementById("dimension-input")
  const dimension = document.getElementById("dimension-id")

  //border style green for the selected card in edit mode
  if (dimension != null){
    cards.forEach((card) => {
      if (dimension.dataset.id == card.dataset.size){
        card.style.border = borderGreen;
      }
    });
  }
  cards.forEach((card, index) => { card.addEventListener('click', (event) => {

    //border style for the selected card in new mode
    if (card.style.border != borderPurple){
      card.style.border = borderPurple;
      if (input != null) {
      input.value = card.dataset.size
      }
      // loop to clean all others cards at f=different index from borders
      cards.forEach((card, index2) => {
        if (index != index2){
        card.style.border = "none";
        }
      });
    }else{
      card.style.border = "none";
    }
  });
});
}

const initOption = () => {

  const source = document.getElementById("line_option")
  const targetInput = document.getElementById("line_option")

  targetInput.addEventListener("keyup", (event) => {

    console.log(targetInput.value)
    //1 letter
    if (targetInput.value.match(/^[A-Z]{1}$/)) {
      console.log("success 1 letter")
    //short < 5 letters
    } else if (targetInput.value.match(/^[A-Z]{1}[\w|\W]{0,4}\S$/)){
      console.log("success short < 5 letters")
    //age 1,2 or 3 numbers
    } else if (targetInput.value.match(/^[0-9]{1,3}$/)){
      console.log("success age 1,2 or 3 numbers")
    //long > 5 letters
    } else if (targetInput.value.match(/^[A-Z]{1}([\w|\W]){4,}\S$/)){
      console.log("succes long > 5 letters")
    //failure
    } else {
      console.log("failure no matches")
    }
  });
}

export { initFormBasket, initFormLine, initCalendarLine, displayPaymentMethod, initSize, initOption }
