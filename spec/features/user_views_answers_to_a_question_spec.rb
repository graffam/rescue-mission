require "rails_helper"

feature "user views answers to a question" do
  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last
  it "sees answers to a question" do
    question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
    description: "The quick, brown fox jumps over a lazy dog.
    DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
    Bawds jog, flick quartz, vex nymphs")
    Answer.create(answertext: "The answer is simple, you simply just
    stop caring about whatever
    this is....just give up...there is no hope...only despair...and darkness...",
    question_id: question1.id, user_id: 1)
    visit question_path(question1)
    expect(page).to have_content "The answer is simple, you simply just
    stop caring about whatever
    this is....just give up...there is no hope...only despair...and darkness..."
  end
  it "doesn't see answers belonging to another question" do
    question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
    description: "The quick, brown fox jumps over a lazy dog.
    DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
    Bawds jog, flick quartz, vex nymphs")
    Answer.create(answertext: "The answer is simple, you simply just
    stop caring about whatever
    this is....just give up...there is no hope...only despair...and darkness...",
    question_id: 1000, user_id: 1)
    visit question_path(question1)
    page.has_text?("The answer is simple, you simply just
    stop caring about whatever
    this is....just give up...there is no hope...only despair...and darkness...", count: 0)
  end
  it "sees the answers posted in order of most recent" do
    question1 = Question.create(title: "THIS IS A REALLLLLLLYU LOOOOOONG STUPPPIIID TITLE",
    description: "The quick, brown fox jumps over a lazy dog.
    DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps.
    Bawds jog, flick quartz, vex nymphs")
    answer1 = Answer.create(answertext: "The answer is simple, you simply just
    stop caring about whatever
    this is....just give up...there is no hope...only despair...and darkness...",
    question_id: question1.id, user_id:1)
    sleep 1
    answer2 = Answer.create(answertext: "The answer is simple, you simply just
    stop caring about whatever
    this is....just give up...there is no hope...only despair...and darkness most recent...",
    question_id: question1.id, user_id:1)
    visit question_path(question1)
    (answer2.answertext).should appear_before(answer1.answertext)
  end

end
