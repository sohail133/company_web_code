class Admin::TeamsController < Admin::BaseController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
    @teams = @teams.where('lower(name) like ?', "%#{params[:title].downcase}%") if params[:title].present?
    @teams = @teams.paginate(page: params[:page], per_page: 12)
  end

  def show; end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to admin_teams_path, notice: 'Team is Successfully Created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to admin_teams_path, notice: 'Team is Successfully Updated.'
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to admin_teams_path, notice: 'Team is Successfully Deleted.'
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :designation, :twitter_url, :facebook_url, :instagram_url, :linkedin_url, :status, :image)
  end
end