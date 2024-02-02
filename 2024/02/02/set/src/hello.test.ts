import { describe, expect, it } from "./dev_deps.ts";
import { hello } from "./hello.ts";

// 
// create a set, with a comparator
// insert an item 
// delete an item
// is_member
// intersection
// union
// to_list
// from_list
// difference (A minus B)

// use a map for internal representation 
// keys ?  3.1415  
// equality is provided for via a comparator, (===) by default
//

function fromList<T>(items:T[]):MySet<T> {
    let result = new MySet<T>();
    items.forEach(item => {
        result.add(item);
    });
    return result;
}

class MySet<T> {
    
    items: Map<T,true>;

    constructor() {
        this.items = new Map();
    }
    isEmpty() { 
        return this.items.size === 0;
    }

    add(item: T) {
        this.items.set(item,true);
    }

    delete(item: T) {
        this.items.delete(item);
    }

    contains(item: T) {
        return this.items.has(item);
    }

    intersection(other: MySet<T>) {
        let result = new MySet();
        this.items.forEach((_,item) => {
            if(other.contains(item)) result.add(item);
        });
        return result;
    }

    difference(other: MySet<T>) {
        return this;
    }


}

describe("set", () => {
  it("a new set is initially empty", () => {
    const mySet = new MySet<number>();
    expect(mySet.isEmpty()).toEqual(true);
  });

  it("after adding an item, set is not empty", () => {
      const mySet = new MySet<number>();
      mySet.add(42);
      expect(mySet.isEmpty()).toEqual(false);
  });

  it("after adding and item, item is a member of the set", () => {
      const mySet = new MySet<number>();
      expect(mySet.contains(42)).toEqual(false); // sanity check
      mySet.add(42);
      expect(mySet.contains(42)).toEqual(true);
  });

  it("after deleting an item from the set, item is not a member any more", () => {
      const mySet = new MySet<number>();
      mySet.add(17);
      mySet.delete(17);
      expect(mySet.contains(17)).toEqual(false);
  });

  it("intersection of an empty set with a non empty set is empty", () => {
      const mySet = new MySet<number>();
      const other = new MySet<number>();
      other.add(17);
      expect(mySet.intersection(other).isEmpty()).toBe(true);
      expect(other.intersection(mySet).isEmpty()).toBe(true);
  });

  it("intersection between two sets having the same item is a set with this item", () => {
      const mySet = new MySet<number>();
      const other = new MySet<number>();
      mySet.add(4807);
      other.add(4807);
      expect(mySet.intersection(other).contains(4807)).toBe(true);
  });
  it("difference between two sets with no intersection is the first set", () => {
      const mySet = new MySet<number>();
      const other = new MySet<number>();
      mySet.add(4807);
      mySet.add(23);
      other.add(17);
      expect(mySet.difference(other).contains(4807)).toBe(true);
      expect(mySet.difference(other).contains(23)).toBe(true);
      expect(mySet.difference(other).contains(17)).toBe(false);
  });
  it("a set can be created from an empty list", () => {
      const mySet = fromList([]);
      expect(mySet.isEmpty()).toBe(true);
  });
  it("a set can be created from a non empty list", () => {
      const mySet = fromList([42,17,23]);
      expect(mySet.contains(42)).toBe(true);
      expect(mySet.contains(17)).toBe(true);
      expect(mySet.contains(23)).toBe(true);
  });
});
