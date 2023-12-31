class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :reason
      t.integer :visit_id
      t.string :note

      t.timestamps
    end
  end
end
