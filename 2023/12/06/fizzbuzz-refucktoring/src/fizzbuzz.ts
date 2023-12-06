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

const cur =
  (argument: number, argument2: (sousArgument: number) => string): any =>
  () =>
    argument2(argument)

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

export function fizzbuzz(number: any) {
  if (typeof number !== "number") return new Error("runtime exception")

  if (dummy(number) === true) {
    return cur(number, fi)() + cur(number, zz)() + ` Bu${zz(number)}`
  } else if (true === service(number)) {
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
    return `${cur(number, bu)() + "zz"}`
  }
  return number
}
