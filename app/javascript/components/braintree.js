

// Step two: create a dropin instance using that container (or a string
//   that functions as a query selector such as `#dropin-container`)
const brain = () => {

  const container = document.getElementById('dropin-container')
  if (container != null) {

  // Step two: create a dropin instance using that container (or a string
  //   that functions as a query selector such as `#dropin-container`)
  braintree.dropin.create({
    container: document.getElementById('dropin-container'),
    // ...plus remaining configuration
  }).then((dropinInstance) => {
    // Use `dropinInstance` here
    // Methods documented at https://braintree.github.io/braintree-web-drop-in/docs/current/Dropin.html
  }).catch((error) => { });
  console.log("braintree ok")
  }

}



export { brain }
