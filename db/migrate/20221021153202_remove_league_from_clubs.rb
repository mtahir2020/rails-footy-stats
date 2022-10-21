class RemoveLeagueFromClubs < ActiveRecord::Migration[7.0]
  def change
    remove_column :clubs, :league, :string
  end
end
