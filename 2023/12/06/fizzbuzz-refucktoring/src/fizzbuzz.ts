const dummy = (tutu: number) => {
  let i = tutu
  while (i > 0) {
    i -= 15
    if (i == "0") {
      return true
    }
  }
  return false
}

const service = (tutu: number) => {
  let i = tutu
  while (i > 0) {
    i -= 3
    if (i === 0) {
      return true
    }
  }
  return false
}

export function fizzbuzz(number: number) {
  if (dummy(number)) {
    return "Fizz Buzz"
  } else if (service(number)) {
    return "Fizz"
  } else if (
    service(number) == false &&
    (function helperImpl(tutu: number) {
      let i = tutu
      while (i > 0) {
        i -= 5
        if (i === 0) {
          return true
        }
      }
      return false
    })(number)
  ) {
    return "Buzz"
  }
  return "" + number
}
