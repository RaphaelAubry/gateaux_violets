
const brain = () => {

  const container = document.getElementById('dropin-container')
  if (container != null) {

    // Step two: create a dropin instance
    braintree.dropin.create({

      container: container,
      authorization: container.dataset.token,
      locale: 'fr_FR',
      card: {
        cardholderName: {
          required: true
        },
      }
    }).then((dropinInstance) => {

      form.addEventListener('submit', (event) => {

        event.preventDefault();
        dropinInstance.requestPaymentMethod().then((payload) => {
          console.log(payload)
          // Step four: when the user is ready to complete their
          //   transaction, use the dropinInstance to get a payment
          //   method nonce for the user's selected payment method, then add
          //   it a the hidden field before submitting the complete form to
          //   a server-side integration
          document.getElementById('nonce').value = payload.nonce;
          form.submit();
        }).catch((error) => { throw error; });
      });
    }).catch((error) => { });
  }
}



export { brain }
