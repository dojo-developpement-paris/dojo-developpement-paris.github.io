import { hello } from "./hello.ts";

const name = Deno.args.at(0) || undefined;

console.log(hello(name));
