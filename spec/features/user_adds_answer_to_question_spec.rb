require "rails_helper"
feature "user adds an answer to a question" do
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  it "adds an answer to the question" do
    question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
    description: "The quick, brown fox jumps over a lazy dog.
    DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
    Bawds jog, flick quartz, vex nymphs")
    visit question_path(question1)
    fill_in "answer_answertext", with: "The answer is simple, you simply just
    stop caring about whatever
    this is....just give up...there is no hope...only despair...and darkness..."
    click_on "Post"
  end

  it "adds an answer that is is less than 50 characters, displays error" do
    question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
    description: "The quick, brown fox jumps over a lazy dog.
    DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
    Bawds jog, flick quartz, vex nymphs")
    visit question_path(question1)

    fill_in "answer_answertext", with: ""
    click_on "Post"
    expect(page).to have_content "Answer must be atleast 50 characters long"
  end
end
