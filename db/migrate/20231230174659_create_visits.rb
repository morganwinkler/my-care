class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.date :start_date
      t.date :end_date
      t.string :hospital
      t.string :reason
      t.integer :user_id

      t.timestamps
    end
  end
end
