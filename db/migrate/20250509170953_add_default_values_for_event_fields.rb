class AddDefaultValuesForEventFields < ActiveRecord::Migration[8.0]
  def change
    change_column_default :events, :date, "TBD"
    change_column_default :events, :location, "TBD"
    change_column_default :events, :name, "TBD"
  end
end
