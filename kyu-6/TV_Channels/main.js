// https://www.codewars.com/kata/5836dce6966f8d1d43000007

function redarr(arr) {
  return Array.from(new Set(arr.sort())).reduce((a, o, i) => Object.assign(a, {[i]: o}), {});
}
