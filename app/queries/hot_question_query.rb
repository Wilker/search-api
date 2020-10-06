class HotQuestionQuery
  class << self

    def get_by_year(year)
      date = DateTime.new(year)
      date_range = (date.beginning_of_year..date.end_of_year)
      question_access_query(date_range)
    end

    def get_by_month(year, month)
      date = DateTime.new(year, month)
      date_range = (date.beginning_of_month..date.end_of_month)
      question_access_query(date_range)
    end

    def get_by_week(year, week)
      wkBegin = Date.commercial(year, week, 1)
      wkEnd = Date.commercial(year, week, 7)
      date_range = (wkBegin..wkEnd)
      question_access_query(date_range)
    end

    # if needed sort and select at the db lvl with this query
    # select question_accesses_question_id
    # from (SELECT SUM(`question_accesses`.`times_accessed`) AS sum_times_accessed,
    #              `question_accesses`.`question_id`         AS question_accesses_question_id
    #       FROM `question_accesses`
    #       WHERE `question_accesses`.`date` BETWEEN '2019-10-05 05:18:49' AND '2020-10-05 05:18:49'
    #       GROUP BY `question_accesses`.`question_id`
    #       ORDER BY sum_times_accessed desc) ;
    def question_access_query(date_range, limit = 10)
      top_question_ids = QuestionAccess.where({date: date_range}).
          group(:question_id).
          sum(:times_accessed).
          sort_by { |k, v| -v }.
          map! { |k, v| k }.
          first(limit)
      mostly_accessed_question(top_question_ids)
    end

    def mostly_accessed_question(top_question_accessed_ids)
      Question.includes(:discipline).where(question_accesses: top_question_accessed_ids)
    end
  end
end