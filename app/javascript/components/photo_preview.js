

const previewImageOnFileSelect = () => {

  const photoInput = document.getElementById('photo-input');
console.log(photoInput)
    if (photoInput) {
console.log(photoInput, 'input foi')
    photoInput.addEventListener('change', () => {

      displayPreview(photoInput);
    })
  }

}


const displayPreview = (input) => {
  console.log(input);
  if (input && input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
  }
}


export { previewImageOnFileSelect };
