function price(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup', () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const value = itemPrice.value;
    let tax = 10;
    let charge = Math.floor(value / tax);
    addTaxPrice.innerHTML = charge;
    profit.innerHTML = value - charge;
  });
};

window.addEventListener('load', price);