class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|

    t.belongs_to :source

   	t.string :title,				default: ""
   	t.string :description,	default: ""
   	t.string :url,					default: ""
   	t.string :url_to_image,	default: ""
   	t.datetime :published_at
   	t.string :content,			default: ""
    t.timestamps
    end
  end
end
