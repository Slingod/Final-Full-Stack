document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('create-event-btn').addEventListener('click', function() {
      // Data event
      const eventData = {
        event: {
          title: 'New Event',
          description: 'This is a new event.',
          start_date: '2025-12-25',
          duration: '2 hours',
          price: '10',
          location: 'Somewhere'
        }
      };
  
      fetch('/events', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: JSON.stringify(eventData)
      })
      .then(response => response.json())
      .then(data => {
        // Create an New Card with the data
        const newCard = document.createElement('div');
        newCard.className = 'card';
        newCard.innerHTML = `
          <h3>${data.title}</h3>
          <p>${data.description}</p>
          <p>Date: ${data.start_date}</p>
          <p>Location: ${data.location}</p>
        `;
        // Add the new card to the card container
        document.getElementById('card-container').appendChild(newCard);
      })
      .catch(error => console.error('Error:', error));
    });
  });
  