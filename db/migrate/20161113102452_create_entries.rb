class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :badge_number, null: false
      t.datetime :check_in, null: false
      t.datetime :check_out

      t.timestamps
    end
  end
end
