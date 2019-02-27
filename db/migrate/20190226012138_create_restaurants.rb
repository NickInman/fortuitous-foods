class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.integer :review_count
      t.integer :rating
      t.string :price
      t.string :city
      t.string :url
      t.string :image_url
      t.integer :zip
      t.string :rest_id
    end
  end
end
