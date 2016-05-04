var Buttons = {
  initialize: function() {
    $(".increment").click(function(e) {
      e.preventDefault();
      Buttons.increment();
    });
    $(".decrement").click(function(e) {
      e.preventDefault();
      Buttons.decrement();
    });
  },

  makeRequest: function(type, url, data, success, error) {
    $.ajax({
      type: type,
      url: url,
      data: data,
      success: success,
      error: error,
    })
  },

  increment: function() {
    this.makeRequest("POST", '/products/' + document.getElementById("productId").getAttribute("data-id") + '/add_to_cart.js', { id: document.getElementById("productId").getAttribute("data-id") }, function(data) { $('#quantity').html(data); }, function(jqXHR, err, exception) { console.log(jqXHR); console.log(err); console.log(exception); })
  },

  decrement: function() {
    this.makeRequest("POST", '/products/' + document.getElementById("productId").getAttribute("data-id") + '/remove_from_cart.js', { id: document.getElementById("productId").getAttribute("data-id") }, function(data) { $('#quantity').html(data); }, function(jqXHR, err, exception) { console.log(jqXHR); console.log(err); console.log(exception); })
  }
}

$(document).ready(function(){
  Buttons.initialize();
})
