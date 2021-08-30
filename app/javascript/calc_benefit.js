const calc = () =>{
  const commission_rate = 0.1 //販売手数料の割合

  const root_price = document.getElementById('item-price');
  const commission = document.getElementById('add-tax-price'); //販売手数料、root_priceの１０％
  const profit = document.getElementById('profit'); //root_priceから販売手数料を引いた額

  //販売手数料を計算するタイミングで呼び出すもの
  const calculate =  function(){
    commission.innerHTML = Math.floor(root_price.value * commission_rate);
    profit.innerHTML = root_price.value - commission.innerHTML;
  }

  //商品情報編集時、ロード時点で販売手数料などを計算するためのもの
  if(root_price.value != ''){
    calculate();
  };

  //入力時に販売手数料を計算する
  root_price.addEventListener('input' , calculate);
}



window.addEventListener('load' , calc);