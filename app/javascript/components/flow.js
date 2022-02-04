const initFlow = () => {

  const flow = document.getElementById("flow")

  if (flow != null){

    const basket = document.getElementById("basket")
    const delivery = document.getElementById("delivery")
    const payment = document.getElementById("payment")
    const complete = document.getElementById("complete")

    const basketGroup = document.querySelector(".basket")
    const deliveryGroup = document.querySelector(".delivery")
    const paymentGroup = document.querySelector(".payment")
    const completeGroup = document.querySelector(".complete")

    switch (flow.dataset.status) {
      case "":
        console.log("start basket")
      case "basket":
          console.log("basket")
          basket.classList.toggle("inprogress")
          deliveryGroup.classList.toggle("noshow")
          paymentGroup.classList.toggle("noshow")
          completeGroup.classList.toggle("noshow")
        break;
      case "delivery":
          console.log("delivery")
          basketGroup.classList.toggle("noshow")
          delivery.classList.toggle("inprogress")
          paymentGroup.classList.toggle("noshow")
          completeGroup.classList.toggle("noshow")
        break;
      case "payment":
          console.log("payment")
          basketGroup.classList.toggle("noshow")
          deliveryGroup.classList.toggle("noshow")
          payment.classList.toggle("inprogress")
          completeGroup.classList.toggle("noshow")
        break;
      case "complete":
        console.log("complete")
        basketGroup.classList.toggle("noshow")
        deliveryGroup.classList.toggle("noshow")
        paymentGroup.classList.toggle("noshow")
        complete.classList.toggle("inprogress")
        break;
      default:
          console.log("Please check the flow display")
    }

  }
}

export { initFlow }
