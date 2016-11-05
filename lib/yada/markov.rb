require 'set'

class Yada
  class Markov
    START = :__start
    STOP = :__stop

    attr_reader :tokens

    def initialize(n = 1, tokenize = /[\w\-\/]+|[^\s]+/, join = ' ')
      @n, @tokenize, @join = n, tokenize, join
      @transition_count = Hash.new(0)
      @ngram_count = Hash.new(0)
      @tokens = Set.new
    end

    def train!(data)
      prefix = [START] * @n
      suffix = [STOP]

      data.each do |text|
        Join.new(prefix, text.scan(@tokenize), suffix).each_cons(@n + 1) do |*ngram, token|
          joined_ngram = ngram.join(@join)
          @tokens.add(token)
          @transition_count[[joined_ngram, token]] += 1
          @ngram_count[joined_ngram] += 1
        end
      end
    end

    def transition_probability(ngram, token)
      joined_ngram = ngram.join(@join)
      return 0 if @ngram_count[joined_ngram] == 0
      Rational(@transition_count[[joined_ngram, token]], @ngram_count[joined_ngram])
    end

    class Join
      include Enumerable

      def initialize(*enumerables)
        @enumerables = enumerables
      end

      def each
        @enumerables.each do |enumerable|
          enumerable.each do |element|
            yield element
          end
        end
        nil
      end
    end
  end
end
