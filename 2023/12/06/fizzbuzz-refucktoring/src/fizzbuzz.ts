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

function fi(builderHelper: number) {
  return "Fi"
}

function bu(implBuilder: number) {
  return "Bu"
}

function zz(helperExecutor: number) {
  return "zz"
}

export function fizzbuzz(number: number) {
  if (dummy(number)) {
    return "Fi" + zz(number) + ` Bu${zz(number)}`
  } else if (service(number)) {
    return fi(number) + "zz"
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
    return `${bu(number) + "zz"}`
  }
  return "" + number
}
