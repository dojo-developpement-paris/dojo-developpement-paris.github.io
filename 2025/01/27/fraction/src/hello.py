import sys


def hello(name: str | None) -> str:
    return f"Hello {name}" if name else "Hello world"


if __name__ == "__main__":
    maybe_first_argument = next(iter(sys.argv[1:]), None)
    print(hello(maybe_first_argument))
