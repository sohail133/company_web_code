class Admin::SettingsController < Admin::BaseController
  before_action :set_setting, only: [:edit, :show, :update, :destroy]

  def index 
    @settings = Setting.all
    @settings = @settings.where('lower(location) like ?', "%#{params[:title].downcase}%") if params[:title].present?
    @settings = @settings.paginate(page: params[:page], per_page: 12)    
  end

  def new
    @setting = Setting.new
    @setting.social_urls = {}
  end

  def show; end
  
  def create
    social_urls = params[:setting][:social_urls].to_json    
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to admin_settings_path, notice: 'Company Information is Successfully Created.'
    else
      render :new
    end
  end

  def edit
    @social_urls = @setting.social_urls
  end  
  
  def update   
    if @setting.update(setting_params)
      redirect_to admin_settings_path, notice: 'Company Information is Successfully Updated.'
    else
      render :edit
    end
  end

  def destroy
    @setting.destroy
    redirect_to admin_settings_path, notice: 'Company Information is Successfully Deleted.'
  end

  private

  def set_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(:location, :email, :phone_number, :copyright, :status, 
      social_urls: [:facebook_url, :twitter_url, :instagram_url, :linkedin_url, :skype_url])
  end
end
    