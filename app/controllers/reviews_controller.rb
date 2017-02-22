class ReviewsController < ApplicationController
  ##check if user is logged in, then find the product
  # before_action :ensure_user_is_logged_in, :find_product
  before_filter :ensure_ownership, except: :create
  before_filter :find_product

  def create
    @review = Review.new(review_params.merge({ product_id: params[:product_id] }) )
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: "Your review is saved!"
    else
      flash[:errors] = @review.errors.full_messages
      redirect_to product_path(@product)
    end
  end

  def destroy
    @review.destroy
    redirect_to product_path(@product), notice: 'Review deleted!'
    # if @review.user == current_user
    #   @review.destroy
    #   redirect_to product_path(@product), notice: 'Review deleted!'
    # else
    #   flash[:errors] = ["You can't delete reviews by other users!"]
    #   redirect_to product_path(@product)
    # end
  end

  private

  def ensure_ownership
    @review = Review.find(params[:id])
    if @review.user != current_user
      flash[:errors] = ["You can't delete reviews by other users!"]
      redirect_to :back
    end
  end

  # def review_params
  #   params.require(:review).permit(
  #     :product_id,
  #     :user_id,
  #     :rating,
  #     :description
  #   )
  # end
  # find parent
  def find_product
    @product = Product.find(params[:product_id])
  end
  #
  # def ensure_user_is_logged_in
  #   redirect_to "/login" unless current_user
  # end
  #
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
