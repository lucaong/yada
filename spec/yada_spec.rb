require "spec_helper"
require 'stringio'

YADA_SPEC_DATA = <<-EOS
Some text, not necessarily ending each line
with a period. And having periods in the middle
of some lines. Like here. Or here. And line
breaks in random places.
EOS

describe Yada do
  it "has a version number" do
    expect(Yada::VERSION).not_to be nil
  end

  it 'generates sentences' do
    yada = Yada.new
    yada.train!(StringIO.new(YADA_SPEC_DATA))
    sentences = yada.generate(3)
    expect(sentences.size).to eq(3)
  end
end
