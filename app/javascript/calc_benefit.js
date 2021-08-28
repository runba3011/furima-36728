const calc = () =>{
  const commission_rate = 0.1 //販売手数料の割合

  const root_price = document.getElementById('item-price');
  const commission = document.getElementById('add-tax-price'); //販売手数料、root_priceの１０％
  const profit = document.getElementById('profit'); //root_priceから販売手数料を引いた額

  root_price.addEventListener('input' , ()=>{
    commission.innerHTML = Math.floor(root_price.value * commission_rate);
    profit.innerHTML = root_price.value - commission.innerHTML;
  })
}


window.addEventListener('load' , calc);