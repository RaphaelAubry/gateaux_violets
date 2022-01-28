const initSearch = () => {

 const bar = document.querySelector(".search-button")

 if (bar != null){
  bar.addEventListener('click', (e) => {
  bar.parentElement.classList.toggle("open")
    });
 }


}

export { initSearch }
