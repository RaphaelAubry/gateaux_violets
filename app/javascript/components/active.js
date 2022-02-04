const initActive = () => {

 const active = document.getElementById("active")

 if (active != null ){

  const activeDiv = document.getElementById("active-flag")
  switch (active.dataset.active){
   case "true":
    activeDiv.innerText = ""
    activeDiv.classList.remove("inactivated")
   break;
   case "false":
    activeDiv.classList.add("inactivated")
    activeDiv.innerText = "Inactive"
   break;
  }
 }
}

export { initActive }
