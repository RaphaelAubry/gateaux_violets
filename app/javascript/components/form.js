const initForm = () => {
  console.log("begin !!!!!")

  // get targets
  const quantity = document.getElementById("line_quantity")
  const total = document.getElementById("total")
  const price = document.getElementById("price")

  quantity.value = 1
  total.innerText = quantity.value * price.dataset.price;

  if (quantity != null && total != null && price != null){


    quantity.addEventListener('input', () => {

      // quantity x price = total
      total.innerText = quantity.value * price.dataset.price;

    })
  };

  console.log("end !!!!!")
}


export { initForm }
