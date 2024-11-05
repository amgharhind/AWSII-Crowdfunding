
// Show the chat messages for the selected conversation
function showChat(conversation) {
  // Get the chat header and update it with the conversation details
  var chatHeader = document.querySelector('.chat-header');
  chatHeader.querySelector('img').src = conversation.querySelector('img').src;
  chatHeader.querySelector('h2').textContent = conversation.querySelector('h2').textContent;

  // Clear the chat messages
  chatMessages.innerHTML = '';

  // Show the chat messages and hide the chat input
  var content = document.querySelector('.content');
  content.querySelector('.chat-messages').style.display = 'block';
  //content.querySelector('.chat-input').style.display = 'none';

  // Show the chat header
  chatHeader.style.display = 'flex';
}

// Add event listeners to the conversations
var conversations = document.querySelectorAll('.chat');
for (var i = 0; i < conversations.length; i++) {
  conversations[i].addEventListener('click', function() {
    showChat(this);
  });
}

// Add event listeners to the send button and message input
var sendButton = document.querySelector('#send-button');
sendButton.addEventListener('click', sendMessage);
var messageInput = document.querySelector('#message-input');
messageInput.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
    sendMessage();
  }
});