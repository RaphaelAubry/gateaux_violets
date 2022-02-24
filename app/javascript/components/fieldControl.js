const upperCase = (field_id) => {

  const target = document.getElementById(field_id)
  if (target){
    target.addEventListener('change', (event)=> {
      target.classList.add("capitalize")
    });
  }
}

export { upperCase }
