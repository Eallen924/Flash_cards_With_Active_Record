class CreateTableCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :term
      t.text :definition
      t.integer :deck_id

      t.timestamps
    end
  end
end
