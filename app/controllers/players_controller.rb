class PlayersController < ApplicationController
  before_action :authenticate_user_from_token, only: [:create, :update, :destroy]
  before_action :set_player, only: [:show, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all

    # Query param filters
    @players = @players.where(team_id: params[:team_id]) if params[:team_id]

    # Paginate
    @players = @players.paginate(:page => params[:page])

    # Avoid n+1 queries
    @players = @players.includes(:team) if include_team

    render json: @players, include_team: include_team, meta: meta_for_collection(@players)
  end

  # GET /players/1
  # GET /players/1.json
  def show
    render json: @player, include_team: true
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      head :no_content
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy

    head :no_content
  end

  private

    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name, :team_id)
    end

    def include_team
      params[:include_team] == 'true'
    end
end
