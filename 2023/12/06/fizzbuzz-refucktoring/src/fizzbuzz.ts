const toto = (tutu: number) => {
  let i = tutu
  while (i > 0) {
    i -= 15
    if (i === 0) {
      return true
    }
  }
  return false
}

export function fizzbuzz(number: number) {
  if (toto(number)) {
    return "Fizz Buzz"
  } else if (number % 3 === 0) {
    return "Fizz"
  } else if (number % 5 === 0) {
    return "Buzz"
  }
  return "" + number
}
