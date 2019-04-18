class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|

    t.string :google_id,	default: ""
    t.string :name,			default: ""
    
    t.timestamps
    end
  end
end
