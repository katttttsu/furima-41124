// app/assets/javascripts/calculator.js
function calculateFeeAndProfit(price) {
  const feeRate = 0.1;
  const fee = price * feeRate;
  const profit = price - fee;
  return {
    fee: fee,
    profit: profit
  };
}

