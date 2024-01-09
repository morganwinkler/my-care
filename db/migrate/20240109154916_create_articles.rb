class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.string :image_url
      t.string :link

      t.timestamps
    end
  end
end
