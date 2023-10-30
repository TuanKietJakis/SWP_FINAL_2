   // Get all the buttons with class "openPopupBtn"
   const openPopupButtons = document.querySelectorAll('.openPopupBtn');

   // Add click event listener to each button
   openPopupButtons.forEach(button => {
     button.addEventListener('click', () => {
       // Show the popup
       document.getElementById('ratingPopup').classList.add("showpopup");
 
       // Show the overlay
       document.getElementById('overlay').classList.remove("hideoverlay");
     });
   });
 
   // Close the popup and hide the overlay when "Cancel" button is clicked
   document.getElementById('closePopupBtn').addEventListener('click', () => {
     // Hide the popup
     document.getElementById('ratingPopup').classList.remove("showpopup");
 
     // Hide the overlay
     document.getElementById('overlay').classList.add("hideoverlay");
   });