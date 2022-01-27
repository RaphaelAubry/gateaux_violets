const initBadge = () => {


const badge = document.getElementById("badge-red")

  if (badge != null){

    const count = document.getElementById("badge-red").dataset.items

    if (count > 0 && count < 10){
      console.log(count + " items in the active basket");
      badge.classList.add("badge-red")
      badge.innerHTML = count
    } else if (count >= 10 && count < 100){
      console.log(count + " items in the active basket");
      badge.classList.add("badge-red")
      badge.style.borderRadius = "40%";
      badge.style.width = "20px"
      badge.innerHTML = count
    } else if (count >= 100){
      console.log(count + " items in the active basket");
      badge.classList.add("badge-red")
      badge.style.borderRadius = "15%";
      badge.style.width = "30px"
      badge.innerHTML = "99+"
    } else {
      console.log("No items in the basket")
      badge.innerHTML = ""
      badge.classList.remove("badge-red")
    }
  }
}

export { initBadge }
