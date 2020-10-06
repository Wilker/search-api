class HottestQuestionsDisciplinesPresenter < Presenter
  def as_json(*args)
    {disciplines: @object.map { |discipline| discipline.name }}
  end
end
