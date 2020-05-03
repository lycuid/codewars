// https://www.codewars.com/kata/513e08acc600c94f01000001/

const mm = (n, mi, ma) => Math.max(mi, Math.min(ma, n));
const preZero = (s) => ('0' + s).slice(-2);
const hex = (x) => preZero(mm(x, 0, 255).toString(16));

function rgb(r, g, b){
  return [r, g, b].map(hex).join('').toUpperCase();
}

