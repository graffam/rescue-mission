class Answer < ActiveRecord::Base
  validates :answertext, presence: true
  validates :answertext, length: {minimum: 50, too_short: "Answer must have atleast 50 characters"}
  belongs_to :question
  belongs_to :user
end
