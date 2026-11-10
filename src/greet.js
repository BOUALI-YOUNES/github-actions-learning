function greet(name) {
  if (typeof name !== 'string' || name.trim() === '') {
    throw new TypeError('name must be a non-empty string');
  }
  return `Hello, ${name.trim()}!`;
}

module.exports = { greet };

if (require.main === module) {
  console.log(greet(process.argv[2] || 'World'));
}