from src.hello import hello


def test_hello_world():
    assert hello(None) == "Hello world"


def test_hello_foo():
    assert hello("foo") == "Hello foo"
