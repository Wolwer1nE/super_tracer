# frozen_string_literal: true

require "test_helper"

class SuperTracerTest < Minitest::Test
  include SuperTracer

  class Demo
    extend SuperTracer::TracePrinter

    def my_method
      puts "Hello"
    end

    trace :my_method
  end

  def test_that_it_has_a_version_number
    refute_nil ::SuperTracer::VERSION
  end

  def test_strings_can_be_colorized
    assert_respond_to '', :colorize
  end

  def test_colors_in_terminal
    puts 'red'.red
    puts 'green'.green
    puts 'yellow'.yellow
    puts 'blue'.blue
  end

  def test_colorize_by_code
    puts 'colorful'.colorize(31)
  end


  def test_stack_tracing
    demo = Demo.new
    demo.my_method
  end

end
