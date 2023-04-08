<!DOCTYPE html>
<html>
  <head>
    <title>Real-time Chat</title>
  </head>
  <body>
    <ul id="messages"></ul>
    <form id="chat-form">
      <input id="message-input" type="text" autocomplete="off" />
      <button>Send</button>
    </form>
    <script src="/socket.io/socket.io.js"></script>
    <script>
      const socket = io();
      const messageList = document.getElementById('messages');
      const chatForm = document.getElementById('chat-form');
      const messageInput = document.getElementById('message-input');
      
      chatForm.addEventListener('submit', e => {
        e.preventDefault();
        const message = messageInput.value;
        socket.emit('chat message', message);
        messageInput.value = '';
        return false;
      });
      
      socket.on('chat message', message => {
        const messageItem = document.createElement('li');
        messageItem.innerText = message;
        messageList.appendChild(messageItem);
      });
    </script>
  </body>
</html>
