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

const tata = (tutu: number) => {
  let i = tutu
  while (i > 0) {
    i -= 3
    if (i === 0) {
      return true
    }
  }
  return false
}

const titi = (tutu: number) => {
  let i = tutu
  while (i > 0) {
    i -= 5
    if (i === 0) {
      return true
    }
  }
  return false
}

export function fizzbuzz(number: number) {
  if (toto(number)) {
    return "Fizz Buzz"
  } else if (tata(number)) {
    return "Fizz"
  } else if (titi(number)) {
    return "Buzz"
  }
  return "" + number
}
