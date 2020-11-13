class AddPinToFamily < ActiveRecord::Migration[6.0]
  def change
    change_table(:families) do |t|
      t.integer :pin
    end
  end
end
