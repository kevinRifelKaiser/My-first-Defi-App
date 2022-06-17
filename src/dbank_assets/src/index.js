import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
    // console.log("finish load");
    update();
});

document.querySelector("form").addEventListener("submit", async (event) => {
    event.preventDefault();
    // console.log("Submited.");

    const button = event.target.querySelector("#submit-btn");

    //Add to balance
    const inputAmount = parseFloat(document.getElementById("input-amount").value);    
    //Withdraw from the balance
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);

    if(document.getElementById("input-amount").value.length != 0) {
        await dbank.topUp(inputAmount);
    }

    if(document.getElementById("withdrawal-amount").value.length != 0) {
        await dbank.withdrawl(outputAmount);
    }

    await dbank.compound();

    update();

    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = "";

    button.removeAttribute("disabled");

});

async function update() {
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerText = currentAmount.toFixed(2);
}