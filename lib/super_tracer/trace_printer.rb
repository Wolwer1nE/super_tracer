# frozen_string_literal: true

module SuperTracer
  module TracePrinter
    def add_tracing(name)
      original_method = instance_method(name)
      define_method name do |*args, &block|
        caller_locations.each{|location| puts location.to_s.green}
        original_method.bind(self ).call(*args, &block)
      end
    end

    def trace(*method_names)
      method_names.each{|name| add_tracing name}
    end
  end
end
