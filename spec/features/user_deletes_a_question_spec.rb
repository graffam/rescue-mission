require 'rails_helper'

feature "Deletable questions" do

  # ```no-highlight
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions
  #
  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted
  it "deletes a question from question/show page" do
      question1 = question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
      description: "The quick, brown fox jumps over a lazy dog.
      DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
      Bawds jog, flick quartz, vex nymphs")
      visit question_path(question1)
      click_on("Delete")
      page.has_text?("THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",count: 0)
    end
  it "delets a question from the question/edit page" do
    question1 = question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
    description: "The quick, brown fox jumps over a lazy dog.
    DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
    Bawds jog, flick quartz, vex nymphs")
    visit edit_question_path(question1)
    click_on("Delete")
    page.has_text?("THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",count: 0)
  end


end
