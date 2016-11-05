require "spec_helper"
require 'stringio'

MARKOV_SPEC_DATA = <<-EOS
Here is some training data.
More training data lines.
And even more here.
Here is another line.
EOS

describe Yada::Markov do
  let(:input) do
    StringIO.new(MARKOV_SPEC_DATA)
  end

  it 'calculates transition probabilities' do
    markov = Yada::Markov.new(2)
    markov.train!(input)
    expect(markov.transition_probability([Yada::Markov::START, Yada::Markov::START], 'Here')).to eq(Rational(2, 4))
    expect(markov.transition_probability(['Here', 'is'], 'some')).to eq(Rational(1, 2))
    expect(markov.transition_probability(['even', 'more'], 'here')).to eq(1)
    expect(markov.transition_probability(['here', '.'], Yada::Markov::STOP)).to eq(1)
    expect(markov.transition_probability(['even', 'more'], 'some')).to eq(0)
    expect(markov.transition_probability(['foo', 'bar'], 'baz')).to eq(0)
  end
end
