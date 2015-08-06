class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :contacts
      t.float :salary
      t.integer :status, default: 0
      t.timestamps null: false
    end
  end
end
