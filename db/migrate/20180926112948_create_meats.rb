class CreateMeats < ActiveRecord::Migration[5.0]
  def change
    create_table :meats do |t|

      t.timestamps
    end
  end
end
