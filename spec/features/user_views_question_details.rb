require "rails_helper"
feature 'view indiviual questions' do
# As a user
# I want to view a question's details
# So that I can effectively understand the question
#
# Acceptance Criteria
#
# - I must be able to get to this page from the questions index
# - I must see the question's title
# - I must see the question's description
  it "goes to an indiviual questions page" do
    question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
    description: "The quick, brown fox jumps over a lazy dog.
    DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
    Bawds jog, flick quartz, vex nymphs")
    visit question_path(question1.id)
  end
  it "dipslays the questions title and description" do
    question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
    description: "The quick, brown fox jumps over a lazy dog.
    DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
    Bawds jog, flick quartz, vex nymphs")
    visit question_path(question1.id)
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.description)
  end
end 
