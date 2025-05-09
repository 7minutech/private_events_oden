class RemoveNotNullConstraintFromEvents < ActiveRecord::Migration[8.0]
  def change
    change_column_null :events, :date, true
  end
end
