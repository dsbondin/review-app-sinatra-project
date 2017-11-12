class CreateUsersProductsAndReviews < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name
      t.string :password_digest
    end

    create_table :products do |t|
      t.string :name
    end

    create_table :reviews do |t|
      t.text :content
      t.integer :user_id
      t.integer :product_id
    end

  end
end
