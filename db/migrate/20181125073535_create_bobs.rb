class CreateBobs < ActiveRecord::Migration[5.0]
  def change
    create_table :bobs do |t|
      t.string :name            #업체이름
      t.string :photo_url       #사진경로
      t.string :detail_url      #상세정보
      
      t.string :open_time       #영업시간
      t.string :contact         #연락처
      
      t.string :category        #분류

      t.timestamps
    end
  end
end
