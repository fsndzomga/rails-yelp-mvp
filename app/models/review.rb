# frozen_string_literal: true

# Represents a review for a restaurant.
class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validate :rating_must_be_an_integer

  private

  def rating_must_be_an_integer
    errors.add(:rating, 'must be an integer') unless rating.is_a? Integer
  end
end
