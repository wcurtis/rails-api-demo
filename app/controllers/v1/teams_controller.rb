class V1::TeamsController < ApplicationController
  # before_action :authenticate_user_from_token, only: [:create, :update, :destroy]
  before_action :set_team, only: [:show, :update, :destroy]

  # def default_serializer_options
  #   {
  #     root: false
  #   }
  # end

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    # Paginate
    @teams = @teams.paginate(:page => params[:page])

    render json: @teams, meta: meta_for_collection(@teams)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    render json: @team
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    authorize @team

    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    @team = Team.find(params[:id])
    authorize @team

    if @team.update(team_params)
      head :no_content
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    authorize @team

    head :no_content
  end

  private

    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
end
