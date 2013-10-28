class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :country
      t.string :region
      t.string :city
      t.string :description
      t.string :background
      t.string :imageurl
      t.integer :user_id

      t.timestamps
    end
    add_index :listings, [:user_id, :created_at]
  end
end
