class CreateTeachingPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :teaching_positions do |t|
      t.belongs_to :teacher, :null => false, :foreign_key => {:to_table => 'users'}, :index => true
      t.belongs_to :school, :null => false, :foreign_key => true, :index => true
      t.index [:teacher_id, :school_id], :unique => true

      t.timestamps
    end
  end
end
