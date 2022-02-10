import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"
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
    total.innerText = (quantity.value * price.dataset.price).toFixed(2);
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



export { initFormBasket, initFormLine, initCalendarLine, displayPaymentMethod }
