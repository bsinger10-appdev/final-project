class EcommerceReviewsController < ApplicationController
  def index
    @ecommerce_reviews = EcommerceReview.all

    render("ecommerce_review_templates/index.html.erb")
  end

  def show
    @ecommerce_review = EcommerceReview.find(params.fetch("id_to_display"))

    render("ecommerce_review_templates/show.html.erb")
  end

  def new_form
    render("ecommerce_review_templates/new_form.html.erb")
  end

  def create_row
    @ecommerce_review = EcommerceReview.new

    @ecommerce_review.site_name = params.fetch("site_name")
    @ecommerce_review.product_number = params.fetch("product_number")
    @ecommerce_review.review_date = params.fetch("review_date")
    @ecommerce_review.review_rating = params.fetch("review_rating")
    @ecommerce_review.review_text = params.fetch("review_text")

    if @ecommerce_review.valid?
      @ecommerce_review.save

      redirect_to("/ecommerce_reviews", :notice => "Ecommerce review created successfully.")
    else
      render("ecommerce_review_templates/new_form.html.erb")
    end
  end

  def edit_form
    @ecommerce_review = EcommerceReview.find(params.fetch("prefill_with_id"))

    render("ecommerce_review_templates/edit_form.html.erb")
  end

  def update_row
    @ecommerce_review = EcommerceReview.find(params.fetch("id_to_modify"))

    @ecommerce_review.site_name = params.fetch("site_name")
    @ecommerce_review.review_date = params.fetch("review_date")
    @ecommerce_review.review_rating = params.fetch("review_rating")
    @ecommerce_review.review_text = params.fetch("review_text")

    if @ecommerce_review.valid?
      @ecommerce_review.save

      redirect_to("/ecommerce_reviews/#{@ecommerce_review.id}", :notice => "Ecommerce review updated successfully.")
    else
      render("ecommerce_review_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @ecommerce_review = EcommerceReview.find(params.fetch("id_to_remove"))

    @ecommerce_review.destroy

    redirect_to("/ecommerce_reviews", :notice => "Ecommerce review deleted successfully.")
  end
end
