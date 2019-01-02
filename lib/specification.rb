require 'equalizer'

class Specification
  Whatever      = true
  SomethingElse = false

  class Result
    include Equalizer.new(:a, :b)

    attr_accessor :a, :b
  end

  attr_reader :result

  def initialize(
    result = Result.new.tap do |r|
      r.a = Whatever
      r.b = Whatever
    end
  )
    @result = result
  end

  def with_something_else
    Specification.new(
      Result.new.tap do |r|
        r.a = SomethingElse
        r.b = SomethingElse
      end
    )
  end

  def ==(specification)
    result == specification.result
  end
end


