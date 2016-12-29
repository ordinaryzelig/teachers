class CreateFollowships < ActiveRecord::Migration[5.0]
  def change
    create_table :followships do |t|
      t.belongs_to :teacher, :null => false, :foreign_key => {:to_table => 'users'}, :index => true
      t.belongs_to :supporter, :null => false, :foreign_key => {:to_table => 'users'}, :index => true
      t.index [:teacher_id, :supporter_id], :unique => true
    end
  end
end
