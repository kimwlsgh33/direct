const form = document.createElement('form');
const input = document.createElement('form');
input.setAttribute('type', 'hidden');

form.action = 'http://localhost:8080/redirect';
form.method = 'POST';

input.setAttribute('cartList', ${cartList});