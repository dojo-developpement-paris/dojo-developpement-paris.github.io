import { hello } from "./hello"

const name = process.argv.at(2) || undefined

console.log(hello(name))
