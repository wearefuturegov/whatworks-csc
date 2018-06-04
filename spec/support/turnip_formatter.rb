# frozen_string_literal: true

# :nocov:
require 'rspec/core/formatters/console_codes'

module Turnip
  module RSpec
    module Execute
      include Turnip::Execute

      def run_step(feature_file, step) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        output = "    #{step}"
        begin
          instance_eval <<-STEP, feature_file, step.line
            step(step)
          STEP
        rescue Turnip::Pending => e
          example = ::RSpec.current_example
          example.metadata[:line_number] = step.line
          example.metadata[:location] = "#{example.metadata[:file_path]}:#{step.line}"

          if ::RSpec.configuration.raise_error_for_unimplemented_steps
            e.backtrace.push "#{feature_file}:#{step.line}:in `#{step.description}'"
            raise
          end

          puts ::RSpec::Core::Formatters::ConsoleCodes.wrap(output, :pending)

          skip("No such step: '#{e}'")
        rescue StandardError, ::RSpec::Expectations::ExpectationNotMetError => e
          puts ::RSpec::Core::Formatters::ConsoleCodes.wrap(output, :failure)
          e.backtrace.push "#{feature_file}:#{step.line}:in `#{step.description}'"
          raise e
        end

        puts ::RSpec::Core::Formatters::ConsoleCodes.wrap(output, :success)
      end
    end

    def self.run_feature(context, feature, filename) # rubocop:disable Metrics/MethodLength
      background_steps = feature.backgrounds.map(&:steps).flatten

      context.before do
        background_steps.each do |step|
          run_step(filename, step)
        end
      end

      feature.scenarios.each do |scenario|
        context.describe scenario.name, scenario.metadata_hash do
          instance_eval <<-SCENARIO, filename, scenario.line
            it ' ' do
              scenario.steps.each do |step|
                run_step(filename, step)
              end
            end
          SCENARIO
        end
      end
    end
  end
end
# :nocov:
