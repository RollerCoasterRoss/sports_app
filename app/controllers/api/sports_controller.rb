class Api::SportsController < ApplicationController
  def index
    @sports = Sport.all
    render "index.json.jb"
  end

  def create
    @sport = Sport.new(
                        team: params[:team],
                        city: params[:city],
                        fanbase_loyalty: params[:fanbase_loyalty],
                        market_size: params[:market_size]
                      )
    @sport.save
    render "show.json.jb"
  end

  def show
    @sport = Sport.find(params[:id])
    render "show.json.jb"
  end

  def update
    @sport = Sport.find(params[:id])

    @sport.team = params[:team] || @sport.team
    @sport.city = params[:city] || @sport.city
    @sport.fanbase_loyalty = params[:fanbase_loyalty] || @sport.fanbase_loyalty
    @sport.market_size = params[:market_size] || @sport.market_size

    @sport.save

    render "show.json.jb"
  end

  def destroy
    sport = Sport.find(params[:id])
    sport.destroy

    render json: {message: "Team Deleted from Database!"}
  end
end
