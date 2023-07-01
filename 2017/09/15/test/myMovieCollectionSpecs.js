"use strict";
import chai from "chai";

chai.should();

// Movie => String
let title = movie => {
    return movie.title;
};

// String => String => Bool
let isInfixOf = query => string => {
    return string.includes(query);
};

// (Movie=>Bool) => [Movie] => [Movie]
let filter = predicate => collection => {
    return collection.filter(predicate);
};

// (.)
let compose = f => g => x => f(g(x));

// String => (Movie => Bool)
let matches = query => compose(isInfixOf(query))(title);

// String => [Movie] => [Movie]
let findByTitle = compose(filter)(matches);

describe('My movie collection search by name', () => {
    let movies = [
        {
            title: "The Matrix",
            year: 1999
        },
        {
            title: "A beautiful mind",
            year: 2001
        },
        {
            title: "Intouchable",
            year: 2011
        },
        {
            title: "Forest Gump",
            year: 1994
        }
    ];
    it('should return empty when none found', () => {
        findByTitle("Interstellar")(movies).should.be.empty;
    });
    it('should return a matching movie', () => {
        findByTitle("The Matrix")(movies).should.deep.equal([{
            title: "The Matrix",
            year: 1999
        }]);
    });
    it('should return all matching movies', () => {
        findByTitle("o")(movies).should.deep.equal([{
            title: "Intouchable",
            year: 2011
        }, {
            title: "Forest Gump",
            year: 1994
        }]);
    });
});
