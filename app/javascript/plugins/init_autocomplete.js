import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('festival_address');
  if (addressInput) {
    places({ container: addressInput });
  }
    const addressVenueInput = document.getElementById('venue_address');
  if (addressVenueInput) {
    places({ container: addressVenueInput });
  }
};

export { initAutocomplete };
