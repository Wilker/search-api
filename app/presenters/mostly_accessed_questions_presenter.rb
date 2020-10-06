class MostlyAccessedQuestionsPresenter < Presenter
  def as_json(*args)
    {
        questions: @object.map do |question|
          [id: question.id,
           statement: question.statement,
           text: question.text,
           answer: question.answer,
           discipline: question.discipline.name]
        end
    }
  end
end
