/* eslint-disable no-console */

/**
 * Script created by maki-color.
 * See https://github.com/underblob/maki-color
 */

var rexStack = /\/(.*)\.js/;

const END = '\033[0m';
const PRE = '\033[0;240;2m';

function color(...args) {
  const [strings, ...tokens] = args;
  tokens.push('');
  const message = strings.reduce((accum, str, i) => (accum += `${str}${tokens[i]}`), '');

  let stack;
  try { throw new Error('GET_STACK'); }
  catch (err) { stack = err.stack; }

  const file = stack
    .split('\n')[2]
    .match(rexStack)[0]
    .replace(process.cwd(), '.');

  const hideOrigin = ['false', '0'].includes(String(process.env.COLOR_ORIGIN));
  const origin = hideOrigin ? '' : `${PRE}${file} » `;
  const colored = message
    .replace(/{BLUE}/g, '\033[0;34m')
    .replace(/{GREEN}/g, '\033[0;32m')
    .replace(/{RED}/g, '\033[0;31m')
    .replace(/{YELLOW}/g, '\033[0;33m');

  console.log(`${origin}${colored}${END}`);
}

function colorInit() {
  const prev = process.env.COLOR_ORIGIN;
  process.env.COLOR_ORIGIN = false;

  console.clear();
  color`\n {BLUE}PROCESS {GREEN}SUCCESS {YELLOW}WARN {RED}FAIL \n`;

  process.env.COLOR_ORIGIN = prev;
}

module.exports = { color, colorInit };
