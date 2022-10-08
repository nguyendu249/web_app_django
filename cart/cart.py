class Cart:
    def __init__(self, request):
        self.session = request.session
        cart = request.session.get('cart')
        if(not cart):
            cart = self.session['cart'] = {}
        self.cart = cart
    #ĐÃ FIX
    def add(self, courseid, price):
        if(courseid == 0):
            self.remove(courseid)
            return
        self.cart[courseid] = {'price': price}
        self.save()

    #ĐÃ FIX
    def remove(self, courseid):
        if(courseid in self.cart):
            del self.cart[courseid]
            self.save()

    def save(self):
        self.session.modified = True

    def get_total_price(self):
        return sum(1*i['price'] for i in self.cart.values())


    def empty(self):
        return len(self.cart) == 0

    def clear(self):
        del self.session['cart']

    def keys(self):
        return map(lambda k: int(k), self.cart.keys())

    def __getitem__(self, arg):
        if isinstance(arg, str):
            return self.cart[arg]['quantity']
        raise TypeError('Slicing cart is not allowed.')


def cart_preprocessor(request):
    return {'cart': Cart(request)}
