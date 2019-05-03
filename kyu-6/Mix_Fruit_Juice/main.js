// https://www.codewars.com/kata/5905871c00881d0e85000015

function mixFruit(arr) {
  const prices = {
    banana: 5, orange: 5, apple: 5, lemon: 5, grapes: 5,
    avocado: 7, strawberry: 7, mango: 7
  }

  return Math.round(
    arr.reduce(
      (cost, fruit) => cost + (prices[fruit.toLowerCase()] || 9), 0
    ) / arr.length
  );
}