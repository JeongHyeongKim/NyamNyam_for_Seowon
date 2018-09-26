class CreateEuropes < ActiveRecord::Migration[5.0]
  def change
    create_table :europes do |t|

      t.timestamps
    end
  end
end
