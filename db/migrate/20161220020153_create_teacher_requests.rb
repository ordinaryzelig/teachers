class CreateTeacherRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_requests do |t|
      t.belongs_to :teaching_position, :null => false, :foreign_key => true, :index => true
      t.text :description, :null => false
      t.datetime :closed_at

      t.timestamps
    end
  end
end
