class ReviewsController < ApplicationController

 def new
  @review = Review.new
  @book = Book.find(params[:book_id])
end

def create
 @review = Review.new(review_params)
 @review.user_id = current_user.id
 @review.book_id = params[:book_id]
  if @review.save
    redirect_to @review.book
  else
    render :new
  end

end


private

def review_params
  params.require(:review).permit(
    :body)
  end
end
