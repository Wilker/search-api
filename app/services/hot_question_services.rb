class HotQuestionServices
  class << self
    def get(params)
      param = convert_params(params)
      return HotQuestionQuery.get_by_week(param[:year], param[:week]) if param[:week].present?
      return HotQuestionQuery.get_by_month(param[:year], param[:month]) if param[:month].present?
      HotQuestionQuery.get_by_year(param[:year]) if param[:year].present?
    end

    def convert_params(params)
      params.to_h.map { |k, v| [k, v.to_i] }.to_h.symbolize_keys
    end
  end
end