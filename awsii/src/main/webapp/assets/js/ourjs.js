document.addEventListener('DOMContentLoaded', function() {
    // Get the toggle button, close button, and chat container
    const toggleButton = document.querySelector('.toggle-chat-btn');
    const closeButton = document.querySelector('.close-chat');
    const chatContainer = document.querySelector('.chat-container');
    
    // Add click event listener to the toggle button
    toggleButton.addEventListener('click', function() {
      // Show the chat container
      chatContainer.style.display = 'block';
      // Hide the toggle button
      toggleButton.classList.add('hidden');
    });
    
    // Add click event listener to the close button
    closeButton.addEventListener('click', function() {
      // Hide the chat container
      chatContainer.style.display = 'none';
      // Show the toggle button
      toggleButton.classList.remove('hidden');
    });
  });
  /*
const label = document.querySelector('label[for="image"]');
const input = document.querySelector('#image');
const preview = document.querySelector('#image-preview');

label.addEventListener('click', () => {
  input.click();
});

input.addEventListener('change', () => {
  preview.innerHTML = '';

  for (let i = 0; i < input.files.length; i++) {
    const file = input.files[i];
    const reader = new FileReader();

    reader.addEventListener('load', () => {
      const img = document.createElement('img');
      img.src = reader.result;
      img.style.maxWidth = '100%';
      img.style.maxHeight = '100%';
      preview.appendChild(img);
    });

    reader.readAsDataURL(file);
  }

  if (input.files.length === 0) {
    preview.innerHTML = 'No images selected';
  }
});
*/
// the price att create poste
   // Get the input element
    const priceInput = document.getElementById("price");
    // Get the error message element
    const priceInvalid = document.getElementById("priceInvalid");

    // Add an event listener to the input field
    priceInput.addEventListener("input", function() {
        // Get the entered value
        const enteredValue = parseFloat(this.value);

        // Check if the entered value is greater than or equal to 15000
        if (enteredValue >= 15000) {
            // Display an error message
            priceInvalid.textContent = "Le prix doit être inférieur à 15000.";
            priceInput.classList.add("is-invalid");
        } else {
            // Clear the error message
            priceInvalid.textContent = "";
            priceInput.classList.remove("is-invalid");
        }
    });