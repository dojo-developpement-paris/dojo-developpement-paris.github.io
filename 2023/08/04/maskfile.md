# Commands

## test

```sh
pytest
```

## lint

```sh
mypy ./**/**.py
```

## format

```sh
black ./**/**.py
```

## install

```sh
poetry install
```

## update

```sh
nix flake update
nix develop . --command \
	poetry update
```
