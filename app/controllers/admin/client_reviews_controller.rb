class Admin::ClientReviewsController < Admin::BaseController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = ClientReview.all
    @reviews = @reviews.where('lower(name) like ?', "%#{params[:title].downcase}%") if params[:title].present?
    @reviews = @reviews.paginate(page: params[:page], per_page: 12)
  end

  def show; end

  def new
    @review = ClientReview.new
  end

  def create
    @review = ClientReview.new(review_params)

    if @review.save
      redirect_to admin_client_reviews_path, notice: 'Review is Successfully Created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to admin_client_reviews_path, notice: 'Review is Successfully Updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to admin_client_reviews_path, notice: 'Review is Successfully Deleted.'
  end

  private

  def set_review
    @review = ClientReview.find(params[:id])
  end

  def review_params
    params.require(:client_review).permit(:name, :designation, :review, :status, :image)
  end
end
