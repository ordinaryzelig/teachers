class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name, :null => false
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :postal_code
      t.string :state
      t.jsonb  :data

      t.timestamps
    end
  end
end
