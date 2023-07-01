"use strict";
import chai from 'chai';
chai.should();

describe('Map Reduce', ()=> {
    it('should filter data', () => {
        [1, 2, 3, 7, 9, 10].filter((i) => i % 2 == 0).should.deep.equal([2, 10]);
    });
    it('should transform data', () => {
        [1, 2, 3, 10].map((i) => i * 2).should.deep.equal([2, 4, 6, 20]);
    });
    it('should compute on data', () => {
        [1, 2, 3, 10].reduce((acc, i) => acc + i, 0).should.deep.equal(16);
    });
});
let myArray = [1, 2, 3, 10];

describe('Abuse reduce', () => {
    it('should compute a new collection', () => {
        myArray.reduce((acc, i) => {
            acc.push(i);
            return acc
        }, []).should.deep.equal(myArray);
    });

    it('should simulate map', () => {
        [1, 2, 3, 10].reduce((acc, i) => {
            acc.push(i * 2);
            return acc
        }, []).should.deep.equal([2, 4, 6, 20]);
    });

    it('should simulate filter', () => {
        [1, 2, 3, 10].reduce((acc, i) => {
            if (i % 2 == 0) acc.push(i);
            return acc
        }, []).should.deep.equal([2, 10]);
    });

    it('should simulate map with higher order function', () => {
        let mapping = (fn) => {
            return (acc, i) => {
                acc.push(fn(i));
                return acc
            }
        };
        [1, 2, 3, 10].reduce(mapping((i) => i * 2), []).should.deep.equal([2, 4, 6, 20]);
        [1, 2, 3, 10].reduce(mapping((i) => i + 2), []).should.deep.equal([3, 4, 5, 12]);
    });

    it('should simulate filter with higher order function', () => {
        let filtering = (fn) => {
            return (acc, i) => {
                if (fn(i)) acc.push(i);
                return acc
            }
        };
        [1, 2, 3, 10].reduce(filtering((i) => i % 2 == 0), []).should.deep.equal([2, 10]);
    });

});

describe('Chaining map and filter in a reduce', () => {
    let consReducer = (acc, i) => {
        acc.push(i);
        return acc
    };
    let sumReducer = (acc, i) => acc + i;
    let mapReducer = (fn, nextReducer) => {
        return (acc, i) => {
            return nextReducer(acc, fn(i));
        }
    };
    let filterReducer = (predicate, nextReducer) => {
        return (acc, i) => {
            return predicate(i) ? nextReducer(acc, i) : acc
        }
    };

    it('should compute a new collection', () => {
        myArray.reduce(consReducer, []).should.deep.equal(myArray);
    });
    it('should simulate map with higher order function', () => {
        let newReducer = mapReducer((i) => i * 2, consReducer);
        [1, 2, 3, 10].reduce(newReducer, [])
                     .should.deep.equal([2, 4, 6, 20]);
        [1, 2, 3, 10].reduce(mapReducer((i) => i * 2, sumReducer), 0).should.deep.equal(32);
    });
    it('should simulate filter with higher order function', () => {
        [1, 2, 3, 10].reduce(
            filterReducer((i) => i % 2 == 0, consReducer), [])
                     .should.deep.equal([2, 10]);
    });
    it('should chain function and avoid temporary collections', () => {
        let chrisTransducer = filterReducer((i) => i % 2 == 0,
                                            mapReducer((i) => i * 4,
                                                       consReducer)
        );
        let sumTransducer = filterReducer((i) => i % 2 == 0,
                                          mapReducer((i) => i * 4,
                                                     sumReducer)
        );
        [1, 2, 3, 10].reduce(chrisTransducer, [])
                     .should.deep.equal([8, 40]);
        [1, 2, 3, 10].reduce(sumTransducer, 0)
                     .should.deep.equal(48);
    });
});

let consReducer = (acc, i) => {
    acc.push(i);
    return acc
};
let sumReducer = (acc, i) => acc + i;
let mapReducer = (fn) => {
    return (nextReducer) => {
        return (acc, i) => {
            return nextReducer(acc, fn(i));
        };
    };
};
let filterReducer = (predicate) => {
    return (nextReducer) => {
        return (acc, i) => {
            return predicate(i) ? nextReducer(acc, i) : acc;
        };
    };
};
describe('Chaining map and filter in a reduce', () => {
    it('should chain function and avoid temporary collections', () => {
        let compose = (f, g) => (x) => f(g(x));
        let filterMapReducer = compose(filterReducer((i) => i % 2 == 0),
                                       mapReducer((i) => i * 4));
        let chrisTransducer = filterMapReducer(consReducer);
        let sumTransducer = filterMapReducer(sumReducer);
        [1, 2, 3, 10].reduce(chrisTransducer, [])
                     .should.deep.equal([8, 40]);
        [1, 2, 3, 10].reduce(sumTransducer, 0)
                     .should.deep.equal(48);
    });
});

describe('compose', () => {
    const compose = (...fns) => {
        return fns.reduce((f, g) => (x) => f(g(x)), (x) => x);
    };
    it('should do nothing on a single function', () => {
        let fn = (i) => i * 2;
        var composedFn = compose(fn);
        composedFn(4).should.equal(fn(4));
    });

    it('should compose two functions', () => {
        let f = (i) => i * 2;
        let g = (i) => i + 1;
        var composedFn = compose(f, g);
        composedFn(4).should.equal(f(g(4)));
    });
    it('should compose three functions', () => {
        let f = (i) => i * 2;
        let g = (i) => i + 1;
        let h = (i) => i * i;
        var composedFn = compose(f, g, h);
        composedFn(4).should.equal(f(g(h(4))));
    });

    it('should chain function and avoid temporary collections', () => {
        let compose = (f, g) => (x) => f(g(x));
        let filterMapReducer = [filterReducer((i) => i % 2 == 0),
                                       mapReducer((i) => i * 4),
                                       filterReducer((i) => i > 10)]
            .reduce(compose,(i) => i);
        let chrisTransducer = filterMapReducer(consReducer);
        [1, 2, 3, 10].reduce(chrisTransducer, [])
                     .should.deep.equal([40]);
    });
});

