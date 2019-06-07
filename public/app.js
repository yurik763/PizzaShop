function something()
{
  var x = window.localStorage.getItem('bbb'); // x = hh['bbb'] создаем хеш

  x = x * 1 + 1; // x = x + 1

  window.localStorage.setItem('bbb', x);  // hh['bbb'] = x присваеваем знаечение нашему ключу bbb

  alert(x);
}

function add_to_cart(id)
{
	var key = 'product_' + id;   // рефакторинг присваеваем имя нашему ключу product_1 или 2 или 3 в зависимости от кол-ва пиц

	var x = window.localStorage.getItem(key);
	x = x*1 + 1                    //считаем сколько раз нажали добавить товар, для каждого товара отдельно
	window.localStorage.setItem(key, x); // hh['key'] = x присваеваем знаечение нашему ключу
}

