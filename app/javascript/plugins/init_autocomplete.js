import places from 'places.js';
// autocomplete for create or search
const initAutocomplete = () => {
    const addressInput = document.getElementById('query');
    if (addressInput) {
        places({ container: addressInput });
    }
};

export { initAutocomplete };