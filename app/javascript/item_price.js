window.addEventListener('load', function tax(item_price){
  const addTaxDom = document.getElementById("add-tax-price");
  const Value = addTaxDom
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("keyup", () => {
    const price = priceInput.value
    addTaxDom.innerHTML = Math.floor(price / 10);
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = price - (price / 10)
  });



  // $("#item_price").on('keyup', function(){
  //   var price = $("#item_price").value();
  //   if( 300 <= price && price <= 9999999) {
  //   var add-tax-price = Math.floor(price / 10);
  //   var profit = dd-tax-p(price - add-tax-price);
  //   $(".arice-span").text(add-tax-price);
  //   $(".profit-span").text(profit);
  //   }
  //   else {
  //   $(".add-tax-price-span").text('');
  //   $(".profit-span").text('');
  //   }
  })