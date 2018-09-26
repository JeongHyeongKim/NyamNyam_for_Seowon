class CreateChickens < ActiveRecord::Migration[5.0]
  def change
    create_table :chickens do |t|

      t.timestamps
    end
  end
end
