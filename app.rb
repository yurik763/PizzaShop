#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	erb :index
end

get '/about' do
	erb :about
end

get '/products' do
  @products = Product.all
  erb :products
end

get '/admin' do
  @orders = Order.order('created_at DESC')
  erb :admin
end

post "/place_order" do
	@order = Order.create params[:order_input]
    erb :order_placed
end

post '/cart' do
	#получаем список параметров и разбираем (parse) их

	@orders_input = params[:orders]  #orders берется из layout
	@items = parse_orders_input @orders_input

	if @items.length == 0   #провекра пустая ли корзина и выводим сообщение если пуста
		return erb :cart_is_empty
	end

	@items.each do |item|   #выводим список продуктов в корзине
		# id, cnt item[0] это id и мы замещаем объектом
		item[0] = Product.find(item[0])
	end

	erb :cart

end

def parse_orders_input orders_input

	s1 = orders_input.split(/,/)
	arr= []

	s1.each do |x|
   		s2 = x.split(/\=/)  # /\=/ считается ругулярное выражение
		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]
		
		arr2 = [id, cnt]
		arr.push arr2
	end
	return arr 
end             
