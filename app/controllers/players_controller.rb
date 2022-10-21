class PlayersController < ApplicationController
  def top
    @players = Player.where("goals > 8")
  end
end
