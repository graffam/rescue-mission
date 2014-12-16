class Question < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, length: {minimum: 40, too_short: "Title must have atleast 40 characters"}
  validates :description, length: {minimum: 150, too_short: "Description must have atleast 150 characters"}
  has_one :userquestion
  has_many :answers
end
