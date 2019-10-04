cart = document.getElementById("cart")
cart.innerHTML = "<%= escape_javascript render(@cart) %>"

# hide lingering flash when adding to the cart
notice = document.getElementById("notice")
if notice
  notice.style.display = "none"
