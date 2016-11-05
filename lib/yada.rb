require "yada/version"
require "yada/input"
require "yada/markov"

class Yada
  DEFAULT_OPTIONS = {
    :ngram => 1,
    :tokenize => /[\w\-\/]+| ?[^\s]+/,
    :join => ' ',
    :punctuation => /[^\w\-\/]+/,
    :stop => /[\.\?!;]\s+/
  }

  def initialize(options = {})
    @options = DEFAULT_OPTIONS.merge(options)
    @markov = Markov.new(@options[:ngram], @options[:tokenize], @options[:join])
  end

  def train!(data)
    input = Input.new(data, @options[:stop])
    @markov.train!(input)
    true
  end

  def generate(n = 1)
    start = [Markov::START] * @options[:ngram]
    (1..n).map do
      generate_tokens(start).reduce('') do |sentence, token|
        if token.match(@options[:punctuation])
          sentence + token
        else
          sentence + @options[:join] + token
        end
      end
    end
  end

  private def generate_tokens(ngram, tokens = [])
    random = rand()
    next_token = @markov.tokens.reduce(0.0) do |probability, token|
      probability += @markov.transition_probability(ngram, token)
      break token if probability > random
      probability
    end

    return tokens if next_token == Markov::STOP
    generate_tokens(ngram.drop(1) + [next_token], tokens + [next_token])
  end
end
