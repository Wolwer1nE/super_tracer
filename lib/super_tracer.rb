# frozen_string_literal: true

require_relative "super_tracer/version"
require_relative "super_tracer/trace_printer"

module SuperTracer
  class Error < StandardError; end

  class ::String
    def colorize(color_code)
      "\e[#{color_code}m#{self}\e[0m "
    end

    def red
      colorize 31
    end

    def green
      colorize 32
    end

    def yellow
      colorize 33
    end

    def blue
      colorize 34
    end
  end
end
