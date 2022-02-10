const upperCase = (field_id) => {

  const target = document.getElementById(field_id)
  if (target != null){
    target.addEventListener('input', (event)=> {
      target.classList.add("capitalize")
    });
  }
}

export { upperCase }
