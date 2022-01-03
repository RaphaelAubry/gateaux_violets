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


export { initForm }
