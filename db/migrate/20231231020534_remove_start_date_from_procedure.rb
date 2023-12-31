class RemoveStartDateFromProcedure < ActiveRecord::Migration[7.0]
  def change
    rename_column :procedures, :start_date, :date
  end
end
