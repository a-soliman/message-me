import consumer from 'channels/consumer';

consumer.subscriptions.create('ChatroomChannel', {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const appendMessage = (message) => {
      const messageContainer = document.querySelector('#message-container');
      messageContainer.innerHTML = messageContainer.innerHTML += message;
    };

    const clearInput = () => {
      const inputElement = document.querySelector("#message-input");
      inputElement.value = "";
    };

    const scrollMessages = () => {
      const element = document.querySelector('#messages');
      element.scrollTo(0, element.scrollHeight)
    };

    clearInput();
    appendMessage(data.message);
    scrollMessages();
  },
});
