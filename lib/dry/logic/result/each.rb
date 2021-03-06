module Dry
  module Logic
    class Result::Each < Result::Multi
      def to_ast
        failed_rules = failures.map { |el| [:el, [success.index(el), el.to_ast]] }
        [:result, [rule.evaluate(input), [:each, failed_rules]]]
      end
    end
  end
end
