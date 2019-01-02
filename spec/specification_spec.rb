require 'spec_helper'
require 'specification'

RSpec.describe Specification do
  specify do
    specification = Specification.new

    expect(specification.with_something_else).not_to eq(specification)
    expect(specification.with_something_else).to     eq(Specification.new.with_something_else)
    expect(specification).to                         eq(Specification.new)
  end

  specify do
    specification = Specification.new
    with_something_else = specification.with_something_else

    expect(with_something_else.result).to eq(something_else_result)
    expect(specification.result).to       eq(whatever_result)
  end

  def something_else_result
    r   = Specification::Result.new
    r.a = Specification::SomethingElse
    r.b = Specification::SomethingElse
    r
  end

  def whatever_result
    r   = Specification::Result.new
    r.a = Specification::Whatever
    r.b = Specification::Whatever
    r
  end
end
