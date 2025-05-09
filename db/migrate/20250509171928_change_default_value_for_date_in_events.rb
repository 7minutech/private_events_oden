class ChangeDefaultValueForDateInEvents < ActiveRecord::Migration[8.0]
  def change
    change_column_default :events, :date, nil
  end
end
