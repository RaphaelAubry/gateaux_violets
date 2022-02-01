const initStatus = () => {

  const statusDivs = document.querySelectorAll(".horizontal.tabl-data > .tabl-status")

  if (statusDivs != null){

    statusDivs.forEach((div) => {
      console.log(div.dataset.status);
      switch (div.dataset.status){
        case 'basket':
          div.classList.add("status-basket")
        break;

        case 'delivery':
          div.classList.add("status-delivery")
        break;

        case 'payment':
          div.classList.add("status-payment")
        break;

        case 'complete':
          div.classList.add("status-complete")
        break;
      }
    });
  }
}

export { initStatus }
