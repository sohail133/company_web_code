class Admin::ServicesController < Admin::BaseController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
    @services = @services.where('lower(title) like ?', "%#{params[:title].downcase}%") if params[:title].present?
    @services = @services.paginate(page: params[:page], per_page: 12)
  end

  def show; end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to admin_services_path, notice: 'Service is Successfully Created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @service.update(service_params)
      redirect_to admin_services_path, notice: 'Service is Successfully Updated.'
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to admin_services_path, notice: 'Service is Successfully Deleted.'
  end

  private

  def set_service
    @service = Service.friendly.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :image, :status)
  end
end
  