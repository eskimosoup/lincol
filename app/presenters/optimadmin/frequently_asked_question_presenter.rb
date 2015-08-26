module Optimadmin
  class FrequentlyAskedQuestionPresenter < Optimadmin::BasePresenter
    presents :frequently_asked_question

    def id
      frequently_asked_question.id
    end

    def question
      frequently_asked_question.question
    end

    def industry
      frequently_asked_question.industry.name if frequently_asked_question.industry.present?
    end
  end
end
