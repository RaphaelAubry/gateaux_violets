const initFlow = () => {

  const flow = document.getElementById("flow")
  console.log("start")


  if (flow != null){

    const basket = document.getElementById("basket")
    const delivery = document.getElementById("delivery")
    const payment = document.getElementById("payment")
    const basketGroup = document.querySelector(".basket")
    const deliveryGroup = document.querySelector(".delivery")
    const paymentGroup = document.querySelector(".payment")

    switch (flow.dataset.status) {
      case "basket":
          console.log("basket")
          basket.classList.toggle("inprogress")
          deliveryGroup.classList.toggle("noshow")
          paymentGroup.classList.toggle("noshow")
        break;
      case "delivery":
          console.log("delivery")
          basketGroup.classList.toggle("noshow")
          delivery.classList.toggle("inprogress")
          paymentGroup.classList.toggle("noshow")
        break;
      case "payment":
          console.log("payment")
          basketGroup.classList.toggle("noshow")
          deliveryGroup.classList.toggle("noshow")
          payment.classList.toggle("inprogress")
        break;
      default:
          console.log("")
    }

  }
  console.log("end")
}

export { initFlow }
