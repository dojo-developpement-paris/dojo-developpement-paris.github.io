class PromiseMaison {
  status: string;
  resolvedValue: number;
  onFullfilled?: (n: number) => number;

  constructor(onFullfilled?: (n: number) => number) {
    this.status = "pending";
    this.onFullfilled = onFullfilled;
  }

  resolve(n: number) {
    this.status = "fullfilled";
    if(this.onFullfilled) {
      this.resolvedValue = this.onFullfilled(n);
    } else {
      this.resolvedValue = n;
    }
    return this;
  }

  reject(n: number) {
    this.status = "rejected";
    return this;
  }

  then(f: (n: number) => unknown) {
    setTimeout(() => f(this.resolvedValue), 1);
    return this;
  }
}

it("on va vérifié que quand on instancie une promise on est en pending", () => {
  const sut = new PromiseMaison();
  expect(sut.status).toBe("pending");
});

it("devrait retourner la promesse quand on appelle resolve", () => {
  const sut = new PromiseMaison();
  expect(sut.resolve(123)).toBe(sut);
});

it("elle retourne la promesse quand on appelle reject", () => {
  const sut = new PromiseMaison();
  const newLocal = sut.reject(124);
  expect(newLocal).toBe(sut);
});

it("devrait retourner un status fullfilled si on appelle resolve dessus", () => {
  const sut = new PromiseMaison();
  sut.resolve(124);
  expect(sut.status).toBe("fullfilled");
});

it("devrait retourner un status rejected si on appelle reject dessus", () => {
  const sut = new PromiseMaison();
  sut.reject(124);
  expect(sut.status).toBe("rejected");
});

it("devrait retourner un status rejected si on appelle reject dessus", () => {
  const promise1 = new PromiseMaison().resolve(123);

  let result;
  promise1.then((value) => {
    result = value;
    expect(result).toBe(123);
  });
});

it("devrait retourner une promesse quand on appelle then", () => {
  const promise1 = new PromiseMaison().resolve(123);

  let result;
  const promise2 = promise1.then((value) => {
    result = value;
    expect(result).toBe(123);
  });

  expect(promise2).toBe(promise1);
});

it.skip("toto", () => {

})
