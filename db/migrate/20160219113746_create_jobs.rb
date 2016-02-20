class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :text
      t.string :company
      t.timestamp
    end
  end
end
