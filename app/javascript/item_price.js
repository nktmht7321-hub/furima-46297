const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTax = Math.floor(inputValue * 0.1);
    
    const profit = Math.floor(inputValue - addTax);

    addTaxDom.innerHTML = addTax;
    profitDom.innerHTML = profit;
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);