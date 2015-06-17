class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :phone
      t.string :phone2
      t.string :address_line1
      t.string :address_line2
      t.string :post_town
      t.belongs_to :role, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :users, :username
  end
end
