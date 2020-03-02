class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
