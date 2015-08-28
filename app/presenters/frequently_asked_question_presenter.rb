class FrequentlyAskedQuestionPresenter < Optimadmin::BasePresenter
  presents :frequently_asked_question

  def id
    frequently_asked_question.id
  end

  def question
    frequently_asked_question.question
  end

  def linked_question
    h.link_to frequently_asked_question.question, '#', class: 'toggle-class', data: { container: "#frequently-asked-question-#{id}", class: 'hide', return: 'false' }
  end

  def answer
    h.raw frequently_asked_question.answer
  end
end
