class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.belongs_to :user
      t.string :handle
      t.timestamps null: false
    end
  end
end
