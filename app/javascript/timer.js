// app/javascript/timer.js
document.addEventListener('DOMContentLoaded', () => {
    let startTime = new Date();
  
    function updateTimer() {
      let now = new Date();
      let elapsedTime = Math.floor((now - startTime) / 1000); // elapsed time in seconds
      let minutes = Math.floor(elapsedTime / 60);
      let seconds = elapsedTime % 60;
  
      // Format the time string
      let timeString = `Time: ${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
  
      // Update the timer element
      document.getElementById('timer').textContent = timeString;
  
      // Update the hidden field with the elapsed time in seconds
      document.getElementById('timer_value').value = elapsedTime;
    }
  
    // Update the timer every second
    setInterval(updateTimer, 1000);
  
    // Ensure the hidden field is updated before the form is submitted
    document.querySelector('form').addEventListener('submit', function(event) {
      let now = new Date();
      let elapsedTime = Math.floor((now - startTime) / 1000); // elapsed time in seconds
      document.getElementById('timer_value').value = elapsedTime;
    });
  });