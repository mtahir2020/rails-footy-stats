class ClubsController < ApplicationController
  def index
    if params[:search]
      @search = params[:search]
      @clubs = Club.where("name LIKE ?", "%#{params[:search]}%")
    else
      @clubs = Club.all
    end
  end

  def show
    @club = Club.find(params[:id])

  end
end
