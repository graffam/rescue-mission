require "rails_helper"
feature "user views all the posts" do
  # ```no-highlight
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first


it "has the title of each question in order of most recently posted" do
  question1 = Question.create(title:"This is the title of question 111111111111111",
  description:"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
  Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis pa")
  question2 = Question.create(title:"This is the title of question 2222222222222222",
  description:"Lorem ipsum dolor sit amet, consectetuer adipiscing elit2.
  Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis pa2")
  visit questions_path
  save_and_open_page
  (question2.title).should appear_before(question1.title)
end
end
