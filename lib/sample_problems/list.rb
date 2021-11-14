# frozen_string_literal: true

require "yaml"

module SampleProblems
  class List
    class NoQuestionDataError < StandardError; end

    class << self
      def all
        @all ||= Dir["#{__dir__}/data/*.yml"].map { |file| YAML.load_file(file) }
      end

      def select_random
        all.sample
      end

      def find_by_contens_id(contens_id)
        question = all.select { |q| q[:contens_id].eql?(contens_id) }
        return raise_no_question_data_error!(contens_id) if question.empty?

        question
      end

      private

      def raise_no_question_data_error!(contens_id)
        raise NoQuestionDataError, "Can't find a #{contens_id} in data"
      end
    end
  end
end
