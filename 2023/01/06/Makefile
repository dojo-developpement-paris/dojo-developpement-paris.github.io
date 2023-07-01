update:
	nix flake update
	direnv exec . \
		nix develop --command \
			elm-json upgrade --unsafe --yes
	pushd "./review" ;\
	direnv exec . \
		nix develop --command \
			elm-json upgrade --unsafe --yes


.PHONY: update
