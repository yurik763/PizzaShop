class AddProducts < ActiveRecord::Migration[5.2]
  def change
  	Product.create :title => 'Гавайская', 
  		:description => 'Это гавайская пицца',
  		:price =>  15,
  		:size => 30,
  		:is_spicy => false,
  		:is_veg => false,
  		:is_best_offer => false,
  		:path_to_image => '/images/hawaiian.jpg'

  	Product.create :title => 'Пепперони', 
  		:description => 'Это пицца Пепперони',
  		:price =>  21,
  		:size => 30,
  		:is_spicy => false,
  		:is_veg => false,
  		:is_best_offer => true,
  		:path_to_image => '/images/pepperoni.jpg'

  	Product.create :title => 'Вегетарианская', 
  		:description => 'Это вегетарианская пицца',
  		:price =>  18,
  		:size => 30,
  		:is_spicy => false,
  		:is_veg => false,
  		:is_best_offer => false,
  		:path_to_image => '/images/veg.jpg'
  end
end
