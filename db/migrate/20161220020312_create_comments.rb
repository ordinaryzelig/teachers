class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, :null => false, :foreign_key => true, :index => true
      t.text :body
      t.belongs_to :teacher_request, :null => false, :foreign_key => true, :index => true

      t.timestamps
    end
  end
end
