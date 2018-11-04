class ChangeUrlColumnType < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :gifts do |t|
        dir.up   { t.change :url, :text }
        dir.down { t.change :url, :string }
      end
    end
  end
end
