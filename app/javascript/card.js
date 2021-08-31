const pay = () => {

  console.log("カード支払いのためのスクリプト");
  const submit = document.getElementById('button');
  submit.addEventListener('click' , (e)=>{
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card ={
      number: formData.get("history_address[number]"),
      cvc: formData.get("history_address[cvc]"),
      exp_month: formData.get("history_address[exp_month]"),
      exp_year: `20${formData.get("history_address[exp_year]")}`,
    }

    Payjp.createToken(card,(status, response) =>{
      if(status == 200){
        const token = response.id;
        console.log(token);
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input , value = ${token} type = "hidden" name = "token"></input>`;
        renderDom.insertAdjacentHTML('beforeend' , tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-number").removeAttribute("name");

        document.getElementById("charge-form").submit();
      }
    });

  });
};


window.addEventListener('load' , pay);