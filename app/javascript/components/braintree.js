
const brain = () => {

  const container = document.getElementById('dropin-container')
  if (container != null) {

    // Step two: create a dropin instance using that container (or a string
    //   that functions as a query selector such as `#dropin-container`)
    braintree.dropin.create({
      container: document.getElementById('dropin-container'),
      authorization: container.dataset.token,
      // ...plus remaining configuration
    }).then((dropinInstance) => {
      console.log(dropinInstance)

      form.addEventListener('submit', (event) => {
        event.preventDefault();

        dropinInstance.requestPaymentMethod().then((payload) => {
          // Step four: when the user is ready to complete their
          //   transaction, use the dropinInstance to get a payment
          //   method nonce for the user's selected payment method, then add
          //   it a the hidden field before submitting the complete form to
          //   a server-side integration
          document.getElementById('nonce').value = payload.nonce;
          console.log(payload.nonce)
          form.submit();
        }).catch((error) => { throw error; });
      });
      // Use `dropinInstance` here
      // Methods documented at https://braintree.github.io/braintree-web-drop-in/docs/current/Dropin.html
    }).catch((error) => { });























  console.log(container)
  }
}



export { brain }
