require "spec_helper"
require 'stringio'

INPUT_SPEC_DATA = <<-EOS
Some text, not necessarily ending each line
with a period. And having periods in the middle
of some lines. Like here. Or here. And line
breaks in random places.
EOS

describe Yada::Input do
  let(:text) do
    StringIO.new(INPUT_SPEC_DATA)
  end

  it 'regroups input based on the stop expression (full stop by default)' do
    input = Yada::Input.new(text)
    sentences = input.to_a
    expect(sentences.size).to eq(5)
    expect(sentences.all? { |s| s.count('.') == 1 }).to be(true)
  end
end
