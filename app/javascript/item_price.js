function price (){
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    addTax = addTaxDom.innerHTML;

    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(inputValue - addTax ));

  });
};

window.addEventListener('load', price);