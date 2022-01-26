const initBadge = () => {

const count = document.getElementById("badge-red").dataset.items
const badge = document.getElementById("badge-red")

  if (count > 0) {
    console.log(count + " items in the active basket");
    badge.classList.add("badge-red")
    badge.innerHTML = count
  } else {
    console.log("No items in the basket")
    badge.innerHTML = ""
    badge.classList.remove("badge-red")
  }
}

export { initBadge }
