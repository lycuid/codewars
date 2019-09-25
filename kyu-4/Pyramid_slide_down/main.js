// https://www.codewars.com/kata/551f23362ff852e2ab000037

const longestSlideDown = (pyramid) => {
  const pLen = pyramid.length;

  if (pLen == 0) return 0;
  if (pLen == 1) return pyramid[0][0];

  let Pyramid = pyramid
    .reverse()
    .map((steps) => steps.map((step) => [step, 0]));

  Pyramid[0] = Pyramid[0].map((step) => step[0]);
  
  for (let i = 1; i < pLen; i++) {
    for (let j = 0; j < Pyramid[i].length; j++) {
      const cElement = Pyramid[i][j];
      const plElement = Pyramid[i-1][j];
      const prElement = Pyramid[i-1][j+1];

      Pyramid[i][j] = cElement[0] + Math.max(plElement, prElement);
    }
  }

  return Pyramid[pLen - 1][0];
}

