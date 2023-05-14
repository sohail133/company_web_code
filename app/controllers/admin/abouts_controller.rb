class Admin::AboutsController < Admin::BaseController
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  def index
    @abouts = About.all
    @abouts = @abouts.where('lower(title) like ?', "%#{params[:title].downcase}%") if params[:title].present?
    @abouts = @abouts.paginate(page: params[:page], per_page: 12)
  end

  def show; end
  
  def new
    @about = About.new
  end

  def create
    @about = About.new(about_params)

    if @about.save
      redirect_to admin_abouts_path, notice: 'About Info is Successfully Created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @about.update(about_params)
      redirect_to admin_abouts_path, notice: 'About Info is Successfully Updated.'
    else
      render :edit
    end
  end

  def destroy
    @about.destroy
    redirect_to admin_abouts_path, notice: 'About Info is Successfully Deleted.'
  end

  private

  def set_about
    @about = About.find(params[:id])
  end

  def about_params
    params.require(:about).permit(:title, :description, :status, :image)
  end
end
    