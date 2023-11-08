# peek mc "foo" -> 42  / None
# poke mc "bar" 17 -> mc'


def mystery_container(key):
    return None

def peek(container, key):
    return container(key)

def poke(container, key, value):
    def internal(k):
        if k == key:
            return value
        else:
            return container(k)
    return internal

def test_container_is_initially_empty():
    assert peek(mystery_container, "foo") == None 

def test_after_storing_a_key_and_value_the_container_should_retrieve_the_value():
    new_mystery_container = poke(mystery_container, "bar", 17)
    assert peek(new_mystery_container, "bar") == 17

def test_the_container_can_store_more_than_one_value():
    new_mystery_container = poke(mystery_container, "qux", 4807)
    new_new_mystery_container = poke(new_mystery_container, "loo", 23)
    assert peek(new_new_mystery_container, "qux") == 4807
    assert peek(new_new_mystery_container, "loo") == 23

