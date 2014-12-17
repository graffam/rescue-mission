class Answer < ActiveRecord::Base
  validates :answertext, presence: {message: "Answer can't be blank"}
  validates :answertext, length: {minimum: 50, too_short: "Answer must be atleast 50 characters long"}
  belongs_to :question
  belongs_to :user
end
