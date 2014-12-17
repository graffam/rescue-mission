require "rails_helper"

feature "user edits a prexisting question" do
  # ```no-highlight
  # As a user
  # I want to edit a question
  # So that I can correct any mistakes or add updates
  #
  # Acceptance Criteria
  #
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page

 it "visits the edit page for a particular question and sees the
    already submitted question" do
  question1 = question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
  description: "The quick, brown fox jumps over a lazy dog.
  DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
  Bawds jog, flick quartz, vex nymphs")
  visit edit_question_path(question1)
  page.has_text?("The quick, brown fox jumps over a lazy dog.
  DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
  Bawds jog, flick quartz, vex nymphs")
 end

 it "unable to submit edited questions without proper character length" do
   question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
   description: "The quick, brown fox jumps over a lazy dog.
   DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
   Bawds jog, flick quartz, vex nymphs")
   visit edit_question_path(question1)
   fill_in "question_title", with: ""
   fill_in "question_description", with: ""
   click_on("Post")
   page.has_text?("Title can't be blank")
   page.has_text?("Title must have atleast 40 characters
   ")
   page.has_text?("Description can't be blank")
   page.has_text?("Description must have atleast 150 characters")
 end

 it "visits edit page from question page" do
   question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
   description: "The quick, brown fox jumps over a lazy dog.
   DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
   Bawds jog, flick quartz, vex nymphs")
   visit question_path(question1)
   click_link "Edit"
   page.has_text?("THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE")
 end

end
