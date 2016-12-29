class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :title
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :category
      t.jsonb  :auth_hash

      t.timestamps
    end
  end
end
