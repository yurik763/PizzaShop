function add_to_cart(id)
{
	var key = 'product_' + id;   // рефакторинг присваеваем имя нашему ключу product_1 или 2 или 3 в зависимости от кол-ва пиц

	var x = window.localStorage.getItem(key);
	x = x*1 + 1                    //считаем сколько раз нажали добавить товар, для каждого товара отдельно
	window.localStorage.setItem(key, x); // hh['key'] = x присваеваем знаечение нашему ключу

	update_orders_input();
	update_orders_button();
	//вывод кол-ва alert('Количество пицц в корзине:' + cart_get_number_of_items());
}

function update_orders_input()
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
} 

function update_orders_button()
{
	var text = 'Корзина ('+ cart_get_number_of_items() + ') шт'
	$('#orders_button').val(text);
}


function cart_get_number_of_items()
{
	var cnt = 0;
	for(var i = 0; i < window.localStorage.length; i++)  // вместо each
	{
		var key = window.localStorage.key(i); // получаем ключ
		var value = window.localStorage.getItem(key); // получаем значение, аналог в руби: hh[key] = x

		if(key.indexOf('product_') == 0)
		{
			cnt = cnt + value * 1; //увеличиваем на единицу
		}
	}
	return cnt;
}

function cart_get_orders()  // Создает строку заказа "product_1=1,product_undefined=2,product_3=3,product_2=2,"
{
	var orders = '';
	for(var i = 0; i < window.localStorage.length; i++)  // вместо each
	{
		var key = window.localStorage.key(i); // получаем ключ
		var value = window.localStorage.getItem(key); // получаем значение, аналог в руби: hh[key] = x

		if(key.indexOf('product_') == 0)
		{
			orders = orders + key + '=' + value + ','
		}
	}
	return orders;
}

function cancel_order()    //очищаем корзину через кнопку Отменить (в div корзины нужно написать div id="cart")
{
	window.localStorage.clear();
	
	update_orders_input();
	update_orders_button();

	$('#cart').text('Ваша корзина очищена');
	
	return false;
}