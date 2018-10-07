class CreateChinas < ActiveRecord::Migration[5.0]
  def change
    create_table :chinas do |t|
      
      t.string :name  #name for store
      t.string :photo_url #photo_info
      t.string :detail_url #detail_info
      t.string :open_time #time_info
      t.string :location #중문, 후문, 서문 구분

      t.timestamps
    end
  end
end
