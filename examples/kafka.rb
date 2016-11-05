$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require 'yada'
require 'open-uri'

# Open The Metamorphosis by Franz Kafka, train a Markov model on it, and use it
# to generate text:
URI.parse('http://www.gutenberg.org/cache/epub/5200/pg5200.txt').open do |text|
  text = text.drop_while { |line|
    !line.start_with?('One morning, when Gregor Samsa')
  }.take_while { |line|
    !line.start_with?('End of the Project Gutenberg EBook')
  }

  yada = Yada.new(ngrams: 1)
  yada.train!(text)

  puts yada.generate(5).join
end
