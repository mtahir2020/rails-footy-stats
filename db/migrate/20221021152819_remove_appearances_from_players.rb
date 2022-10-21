class RemoveAppearancesFromPlayers < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :appearances, :string
  end
end
