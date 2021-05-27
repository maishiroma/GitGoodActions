import pytest


def test_test():
    print("true")
    assert 1 == 1

def test_fail():
    print("fail")
    assert 1 == 1  
    #assert 2 == 1