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

let processorAbstract

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
        let j = 0
        while (j < 5) {
          i -= 1
          j++
        }
        if (i === 0) {
          processorAbstract = 1 == 1
          return processorAbstract
        }
      }
      processorAbstract = false
      return true
    })(number) &&
    processorAbstract
  ) {
    return `${bu(number) + "zz"}`
  }
  return "" + number
}
