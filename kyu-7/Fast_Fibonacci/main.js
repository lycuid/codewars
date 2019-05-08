// https://www.codewars.com/kata/557226cd3554219bdf00019b/solutions/javascript

function fib(number) {
  const tail_fib = (n, acc1, acc2) => {
    if (n == 0) return acc1;
    return tail_fib(n - 1, acc2, acc1 + acc2);
  }

  return tail_fib(number, 0, 1);
}
