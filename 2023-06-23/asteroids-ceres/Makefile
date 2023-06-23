FILES=$(shell git ls-files -- '*.hs')


test:
	runhaskell ${FILES}


lint:
	hlint ${FILES}


format:
	fourmolu --mode inplace ${FILES}


update:
	nix flake update


.PHONY: test lint format update
