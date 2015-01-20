class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.belongs_to :user
      t.string :word
      t.timestamps null: false
    end
  end
end
