class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.references :user, null:false
    	t.string :title
    	t.string :body
      t.string :status, null: false, default: "draft"
    	t.integer :category_id, null:false, default: "others"    	
      t.timestamps
    end
    add_index :articles, [:user_id, :created_at]
  end
end