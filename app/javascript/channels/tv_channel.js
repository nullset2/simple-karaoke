import consumer from "channels/consumer"

consumer.subscriptions.create("TvChannel", {
  connected() {
    console.log("Connected to TvChannel")
  },

  disconnected() {},

  received(data) {
    const el = document.getElementById("tv_requests")
    if (el && data.html) {
      el.innerHTML = data.html
    }
  }
});
