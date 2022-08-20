const uniqueBooks = books => 
{ const cart = {}
  books.forEach(element => {
    if (cart[element]) 
      cart[element]++;
    else
      cart[element] = 1
  });
  return cart
};

const discount = [1,1,0.95,0.9,0.8,0.75]

const calculatePrice = ({cart, price}) => {
  const distinctBooks = Object.keys(cart).length;
  if(distinctBooks == 0) {
    return {cart, price};
  }
  for (let book in cart) {
    cart[book]--;
    if (cart[book] == 0) delete cart[book]
  }
  return calculatePrice ({cart, 
    price: (price + 8.0 * distinctBooks 
      * discount[distinctBooks])});

}
const price = books => 
  { const cart = uniqueBooks(books);
    
    let {price} = calculatePrice({cart, price: 0})
    return price
  };

describe ('potter', () =>{
  test('the price of nothing is 0', () => {
    expect(price([])).toBe(0.0);
  });
  test('One tome is 8', () => {
    expect(price([1])).toBe(8.0);
    expect(price([1, 1, 1])).toBe(8.0 * 3);
  });
  test('Two different tomes get a 5% discount', () => {
    expect(price([1, 2])).toBe(16.0 * 0.95);
    expect(price([2, 1])).toBe(16.0 * 0.95);
    expect(price([2, 1, 1])).toBe(16.0 * 0.95 + 8.0);
  });
  test('Three different tomes get a 10% discount', () => {
    expect(price([1, 2, 3])).toBe(8.0 * 3 * 0.90);    
  });
  test('Four different tomes get a 20% discount', () => {
    expect(price([1, 2, 3, 4])).toBe(8.0 * 4 * 0.80);    
    // expect(price([1, 2, 3, 4, 2, 3, 4, 5]))
    //   .toBe(8.0 * 8 * 0.8);    
  });
  test('Five different tomes get a 25% discount', () => {
    expect(price([1, 2, 3, 4, 5])).toBe(8.0 * 5 * 0.75);    
  });
});