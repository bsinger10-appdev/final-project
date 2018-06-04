# == Schema Information
#
# Table name: ecommerce_reviews
#
#  id            :integer          not null, primary key
#  site_name     :string
#  review_date   :date
#  review_rating :float
#  review_text   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class EcommerceReview < ApplicationRecord
end
