class CreateEcommerceReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :ecommerce_reviews do |t|
      t.string :site_name
      t.string :product_number
      t.date :review_date
      t.float :review_rating
      t.string :review_text

      t.timestamps
    end
  end
end
