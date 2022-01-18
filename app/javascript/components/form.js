import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"



const initForm = () => {

  // get targets
  const flow = document.getElementById("flow")
  const quantity = document.getElementById("line_quantity")
  const total = document.getElementById("total")
  const price = document.getElementById("price")

  if (quantity != null && total != null && price != null && flow != null){

    //check if there is already a quantity line in the database

    if (flow.dataset.id == ""){
        quantity.value = 1
    }

    total.innerText = quantity.value * price.dataset.price;

    quantity.addEventListener('input', () => {

      // quantity x price = total
      total.innerText = quantity.value * price.dataset.price;

    })
  };
}

const calendar = () => {

  const date = document.getElementById("delivery_date")
  const dbdate = document.getElementById("dbdate")

  if (date != null) {

    const delivery_date = JSON.parse(dbdate.dataset.deliverydate);
    console.log(delivery_date)
    const fp = flatpickr(date, {
      defaultDate: delivery_date,
      enableTime: true,
      dateFormat: "Le d/m/Y à H:i",
      "locale": French,
      minDate: minDeliveryDate(+(24*7)),
    });

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
    const paypalIcon = document.querySelector(".fa-cc-paypal")
    const manualPaymentDiv = document.querySelector(".manual-payment")
    const ePaymentDiv = document.querySelector(".e-payment")

    cashDiv.style.display = "none";
    paypalDiv.style.display = "none";
    cashIcon.style.display = "none";
    paypalIcon.style.display = "none";
    manualPaymentDiv.style.display = "";
    ePaymentDiv.style.display = "none";

    paymentType.addEventListener('change', () => {

    console.log(paymentType.options[paymentType.selectedIndex].value)

      switch (paymentType.options[paymentType.selectedIndex].value) {
        case "Cash":
          IBANDiv.style.display = "none";
          cashDiv.style.display = "";
          paypalDiv.style.display = "none";
          IBANIcon.style.display = "none";
          cashIcon.style.display = "";
          paypalIcon.style.display = "none";
          manualPaymentDiv.style.display = "";
          ePaymentDiv.style.display = "none";
          break;
        case "Bank transfer":
          IBANDiv.style.display = "";
          cashDiv.style.display = "none";
          paypalDiv.style.display = "none";
          IBANIcon.style.display = "";
          cashIcon.style.display = "none";
          paypalIcon.style.display = "none";
          manualPaymentDiv.style.display = "";
          ePaymentDiv.style.display = "none";
          break;
        case "Card":
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



export { initForm, calendar, displayPaymentMethod }
