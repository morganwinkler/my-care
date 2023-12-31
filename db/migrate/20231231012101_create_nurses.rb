class CreateNurses < ActiveRecord::Migration[7.0]
  def change
    create_table :nurses do |t|
      t.string :name
      t.string :time
      t.integer :visit_id
      t.date :date
      t.string :note

      t.timestamps
    end
  end
end
