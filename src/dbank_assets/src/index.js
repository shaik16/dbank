import { dbank } from '../../declarations/dbank'

window.addEventListener('load', async () => {
  const currentAmount = await dbank.checkBalance()
  document.getElementById('value').innerText = currentAmount.toFixed(2)
})

document.querySelector('form').addEventListener('submit', async (e) => {
  e.preventDefault()

  const button = event.target.querySelector('#submit-btn')
  const inputAmount = parseFloat(document.getElementById('input-amount').value)
  const outputAmount = parseFloat(document.getElementById('withdrawal-amount').value)

  button.setAttribute('disabled', true)
  if (inputAmount) {
    await dbank.topUp(inputAmount)
  }

  if (outputAmount) {
    await dbank.withdrawl(outputAmount)
  }

  await dbank.compound()

  const currentAmount = await dbank.checkBalance()
  document.getElementById('value').innerText = currentAmount.toFixed(2)
  button.removeAttribute('disabled')
})
