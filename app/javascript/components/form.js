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

const displayIBAN = () => {

  const iban = document.querySelector(".IBAN")
  const paymentType = document.querySelector("#paymentType")

  if ( iban != null && paymentType != null ){

    paymentType.addEventListener('change', () => {

    console.log(paymentType.options[paymentType.selectedIndex].value)
    console.log(iban)

      switch (paymentType.options[paymentType.selectedIndex].value) {
        case "Cash":
          iban.style.visibility = "hidden"
          break;
        case "Bank transfer":
          iban.style.visibility = "visible";
          break;
      }
    })
  }
}



export { initForm, calendar, displayIBAN }
