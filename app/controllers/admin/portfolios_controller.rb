class Admin::PortfoliosController < Admin::BaseController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
    @portfolios = @portfolios.where('lower(title) like ?', "%#{params[:title].downcase}%") if params[:title].present?
    @portfolios = @portfolios.paginate(page: params[:page], per_page: 12)
  end

  def show; end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to admin_portfolios_path, notice: 'Portfolio is Successfully Created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to admin_portfolios_path, notice: 'Portfolio is Successfully Updated.'
    else
      render :edit
    end
  end

  def destroy
    if @portfolio.destroy
      redirect_to admin_portfolios_path, notice: 'Portfolio is Successfully Deleted.'
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.friendly.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :client, :project_date, :project_url, :description, :status, :category_id, images: [])
  end    
end
