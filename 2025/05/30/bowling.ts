type Equal<Gauche, Droite> = Gauche extends Droite ? Droite extends Gauche ? true : false : false;

const cas1: Equal<number, 2> = false
const cas2: Equal<2, 3> = false
const cas3: Equal<2, 2> = true
const cas4: Equal<1|2, 2> = true // ça c'est de la triche

// Calculatrice pour l'ajout
type Length<Tableau extends any[]> = Tableau extends { length: infer L } ? L : 'toto'
const length_0: Equal<Length<[]>, 0> = true
const length_1: Equal<Length<[number]>, 1> = true
const length_n: Equal<Length<number[]>, number> = true

type Element = 'element';
type TupleOfLength<L extends number, T extends Element[] = []> = T extends { length: L} ? T : TupleOfLength<L, [...T, Element]>
const tuple_of_length: Equal<TupleOfLength<0>, []> = true
const tuple_of_length_1: Equal<TupleOfLength<1>, [Element]> = true
const tuple_of_length_3: Equal<TupleOfLength<3>, [Element, Element, Element]> = true

type AddLiterals<A extends number, B extends number> = Length<[...TupleOfLength<A>, ...TupleOfLength<B>]>;
const add_simple: Equal<AddLiterals<0, 1>, 1> = true
const add_simple_2: Equal<AddLiterals<3, 4>, 7> = true

// Bowling
type BowlingScore<Partie extends number[]> = Partie[0];

const goutiere: Equal<BowlingScore<[0]>, 0> = true
const une_quille: Equal<BowlingScore<[1]>, 1> = true
//const une_quille_deuxieme_throw: Equal<BowlingScore<[0,1]>, 1> = true