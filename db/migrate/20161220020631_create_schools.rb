class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name, :null => false
      t.string :address_1, :null => false
      t.string :address_2
      t.string :city, :null => false
      t.string :postal_code, :null => false
      t.string :state, :null => false

      t.timestamps
    end
  end
end
