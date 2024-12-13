class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :salary
      t.string :category

      t.timestamps
    end
  end
end
