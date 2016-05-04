var Buttons = {
  initialize: function() {
    $(".increment").click(function(e) {
      e.preventDefault();
      var button = this
      Buttons.increment(button);
    });
    $(".decrement").click(function(e) {
      e.preventDefault();
      var button = this
      Buttons.decrement(button);
    });
    $(".clear_cart").click(function(e) {
      e.preventDefault();
      var button = this
      Buttons.clear_cart(button);
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

  increment: function(button) {
    var type = "POST"
    var productId = $(button).closest(".product").data("productid")
    var url = '/products/' + productId + '/add_to_cart.js'

    this.makeRequest(
      type,
      url,
      { id: productId },
      function(data) { $('div[data-productid=' + productId + ']').find('.quantity').html(data) },
      function(jqXHR, err, exception) { console.log(jqXHR); console.log(err); console.log(exception);
    })
  },

  decrement: function(button) {
    var type = "POST"
    var productId = $(button).closest(".product").data("productid")
    var url = '/products/' + productId + '/remove_from_cart.js'

    this.makeRequest(
      type,
      url,
      { id: productId },
      function(data) { $('div[data-productid=' + productId + ']').find('.quantity').html(data) },
      function(jqXHR, err, exception) { console.log(jqXHR); console.log(err); console.log(exception);
    })
  },

  clear_cart: function(button) {
    var type = "POST"
    var cartId = $(button).closest(".cart").data("cartid")
    var url = '/shopping_carts/' + cartId + '/clear_cart.js'

    this.makeRequest(
      type,
      url,
      { id: cartId },
      function(data) { $('.cart').html(data); },
      function(jqXHR, err, exception) { console.log(jqXHR); console.log(err); console.log(exception);
    })
  },
}

$(document).ready(function(){
  Buttons.initialize();
})
