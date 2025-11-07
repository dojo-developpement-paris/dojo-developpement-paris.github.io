import { randomInt } from "fp-ts/lib/Random"
import { Sand, fall } from "./sand.ts"

const grainSize = 5

const width = 120
const height = 60
const sand: Sand = []
for (let y = 0; y < height; y++) {
  sand[y] = []
  for (let x = 0; x < width; x++) {
    sand[y][x] = " "
  }
}

const canvas = <HTMLCanvasElement>document.getElementById("canvas")!
canvas.setAttribute("width", "" + grainSize * width)
canvas.setAttribute("height", "" + grainSize * height)
const context = canvas.getContext("2d")!

const render = () => {
  context.clearRect(0, 0, width * grainSize, height * grainSize)
  for (let y = 0; y < height; y++) {
    for (let x = 0; x < width; x++) {
      if (sand[y][x] === " ") continue
      context.fillStyle = sand[y][x]
      context.fillRect(x * grainSize, y * grainSize, grainSize, grainSize)
    }
  }
}

let cursorPosition = { x: 0, y: 0 }
canvas.onmousemove = (event: MouseEvent) => {
  cursorPosition = {
    x: Math.floor(event.offsetX / grainSize),
    y: Math.floor(event.offsetY / grainSize),
  }
}

const addSand = () => {
  const brushWidth = 4
  const lowerBound = -brushWidth / 2
  const upperBound = brushWidth / 2
  for (let xDelta = lowerBound; xDelta < upperBound; xDelta++) {
    for (let yDelta = lowerBound; yDelta < upperBound; yDelta++) {
      if (randomInt(0, 100)() < 60) {
        addGrain(cursorPosition.x + xDelta, cursorPosition.y + yDelta)
      }
    }
  }
}

let hue = 1
const addGrain = (x: number, y: number) => {
  if (sand[y][x] === " ") {
    sand[y][x] = `hsl(${hue}, 100%, 50%)`
    hue = (hue + 0.1) % 360
  }
}
canvas.onmousedown = () => {
  addSand()
  const interval = setInterval(addSand, 20)
  canvas.onmouseup = () => clearInterval(interval)
}

render()
setInterval(() => {
  render()
  fall(sand)
}, 1000)
