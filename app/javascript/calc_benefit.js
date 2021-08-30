const calc = () =>{
  const commission_rate = 0.1 

  const root_price = document.getElementById('item-price');
  const commission = document.getElementById('add-tax-price'); 
  const profit = document.getElementById('profit'); 

  const calculate =  function(){
    commission.innerHTML = Math.floor(root_price.value * commission_rate);
    profit.innerHTML = root_price.value - commission.innerHTML;
  }

  if(root_price.value != ''){
    calculate();
  };

  root_price.addEventListener('input' , calculate);
}



window.addEventListener('load' , calc);