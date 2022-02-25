import places from 'places.js';

const autocompleteAddress = () => {

  const inputAddress = document.querySelector('#form-address')

  if (inputAddress) {

    (function () {
      var placesAutocomplete = places({
        //appId: '',
        //apiKey: '',
        container: document.querySelector('#form-address'),
        templates: {
          value: function (suggestion) {
            return suggestion.name;
          }
        }
      }).configure({
        type: 'address'
      });
      placesAutocomplete.on('change', function resultSelected(e) {
        //document.querySelector('#form-address2').value = e.suggestion.administrative || '';
        document.querySelector('#form-city').value = e.suggestion.city || '';
        document.querySelector('#form-zip').value = e.suggestion.postcode || '';
      });
    })
      ();

  }

}

export { autocompleteAddress }
