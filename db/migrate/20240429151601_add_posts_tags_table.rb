class AddPostsTagsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :posts_tags do |t|
      t.belongs_to :post
      t.belongs_to :tag
      t.timestamps
    end
  end
end
