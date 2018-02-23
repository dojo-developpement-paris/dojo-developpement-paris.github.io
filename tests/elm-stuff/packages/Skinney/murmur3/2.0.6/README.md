# Murmur 3

This is an elm implementation of the murmur 3 hash function.
Murmur 3 is well suited for hashing strings quickly, and with a low chance of collisions.
It is not, however, suitable for cryptographic use (like hashing a password).

To use, simply import the namespace:

    import Murmur3

Then hash a string

    Murmur3.hashString 1234 "test"
