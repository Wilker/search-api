class HotQuestionServices
  class << self
    def get(params)
      param = convert_params(params)

      if param[:week].present?
        return Rails.cache.fetch(["by_week", :get]) do
          HotQuestionQuery.get_by_week(param[:year], param[:week])
        end
      end

      if param[:month].present?
        return Rails.cache.fetch(["by_month", :get]) do
          HotQuestionQuery.get_by_month(param[:year], param[:month])
        end
      end

      Rails.cache.fetch(["by_year", :get]) do
        HotQuestionQuery.get_by_year(param[:year]) if param[:year].present?
      end
    end

    def convert_params(params)
      params.to_h.map { |k, v| [k, v.to_i] }.to_h.symbolize_keys
    end
  end
end