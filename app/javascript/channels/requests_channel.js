import consumer from "channels/consumer"

consumer.subscriptions.create("RequestsChannel", {
  connected() {
    console.log("Connected to RequestsChannel")
  },

  disconnected() {},

  received(data) {
    const el = document.getElementById("requests")
    if (el && data.html) {
      el.innerHTML = data.html
    }
  }
});
