class CreateFlours < ActiveRecord::Migration[5.0]
  def change
    create_table :flours do |t|
      
      t.string :name  #name for store
      t.string :photo_url #photo_info
      t.string :detail_url #detail_info

      t.timestamps
    end
  end
end
