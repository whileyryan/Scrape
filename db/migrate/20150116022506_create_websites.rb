class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.belongs_to :user
      t.string :href
      t.timestamps null: false
    end
  end
end
