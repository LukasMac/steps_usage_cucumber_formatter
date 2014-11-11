require 'cucumber/formatter/pretty'

module Formatter
  class StepsUsageFormatter < Cucumber::Formatter::Pretty
    
    def scenario_name(keyword, name, file_colon_line, source_indent)
      file_colon_line = "#{file_colon_line} started at #{timestamp_short}"
      super
    end

    def after_features(features)
      @io.puts(format_string("NOT MATCHED BY ANY STEPS:", :failed))
      
      @runtime.unmatched_step_definitions.each do |step_definition|
        print_step_definition_(step_definition, max_length)
      end
      @io.puts

      super
    end

    private

    def max_step_definition_length
      @runtime.unmatched_step_definitions.map do |step_definition|
        step_definition.regexp_source.unpack('U*').length
      end.max
    end

    def timestamp_short
      "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}]"
    end

    def print_step_definition_(step_definition, max_length)
      @io.print format_string("  " + step_definition.regexp_source, :skipped)
      if @options[:source]
        indent = max_length - step_definition.regexp_source.unpack('U*').length
        line_comment = "   # #{step_definition.file_colon_line}".indent(indent)
        @io.print(format_string(line_comment, :comment))
      end
      @io.puts
    end
  end
end
