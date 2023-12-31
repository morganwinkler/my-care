class CreateProcedures < ActiveRecord::Migration[7.0]
  def change
    create_table :procedures do |t|
      t.string :name
      t.string :reason
      t.string :result
      t.integer :visit_id
      t.string :note
      t.date :start_date
      

      t.timestamps
    end
  end
end
