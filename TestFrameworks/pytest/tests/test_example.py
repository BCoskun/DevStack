from pylenium.driver import Pylenium

def test_google(py: Pylenium):
    py.visit("http://google.com")
    py.get('[name="q"]').type('cats')
    py.get('[name="btnK"]').submit()    
    assert py.should().contain_title('cats')