class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :icon
      t.text :description
      t.text :promo_text
      t.text :country
      t.text :lang
      t.decimal :price
      t.string :category
      t.bigint :user_id
      t.bigint :ext_id
      t.bigint :firm_id

      t.timestamps
    end
  end
end
