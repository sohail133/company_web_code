class Admin::TechnologiesController < Admin::BaseController
  before_action :set_technology, only: [:edit, :update, :destroy]

  def index
    @technologies = Technology.all
    @technologies = @technologies.where('lower(title) like ?', "%#{params[:title].downcase}%") if params[:title].present?
    @technologies = @technologies.paginate(page: params[:page], per_page: 12)
  end

  def new
    @technology = Technology.new
  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      redirect_to admin_technologies_path, notice: 'Technology is Successfully Created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @technology.update(technology_params)
      redirect_to admin_technologies_path, notice: 'Technology is Successfully Updated.'
    else
      render :edit
    end
  end

  def destroy
    @technology.destroy
    redirect_to admin_technologies_path, notice: 'Technology is Successfully Deleted.'
  end

  private

  def set_technology
    @technology = Technology.find(params[:id])
  end

  def technology_params
    params.require(:technology).permit(:status, :image)
  end
end
