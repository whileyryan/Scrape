class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :user
      t.string :title
      t.string :href
      t.string :sport
      t.timestamps null: false
    end
  end
end
