#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
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

post '/cart' do
	@orders_input = params[:orders]  #orders берется из layout
	@items = parse_orders_input @orders_input

	@items.each do |item|
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
