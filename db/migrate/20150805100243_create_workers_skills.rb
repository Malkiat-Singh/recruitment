class CreateWorkersSkills < ActiveRecord::Migration
  def change
    create_table :workers_skills, :id => false  do |t|
        t.references :worker
        t.references :skill         
    end
  end
end