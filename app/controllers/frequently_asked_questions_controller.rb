class FrequentlyAskedQuestionsController < ApplicationController
  def index
    @additional_content = AdditionalContentPresenter.new(object: AdditionalContent.find_by(area: 'Frequently Asked Questions index'), view_template: view_context)
    @frequently_asked_questions = BaseCollectionPresenter.new(collection: @industry.displayable_frequently_asked_questions, view_template: view_context, presenter: FrequentlyAskedQuestionPresenter)
  end
end
