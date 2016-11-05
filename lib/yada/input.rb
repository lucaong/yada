class Yada
  class Input
    include Enumerable

    def initialize(source, stop = /\.\s+/)
      @source, @stop = source, stop
    end

    def each(&block)
      accumulator = ''
      @source.each do |line|
        accumulator = regroup(accumulator, line, &block)
      end
      yield accumulator if accumulator != ''
      nil
    end

    private def regroup(accumulator, text, &block)
      pre, stop, rest = text.partition(@stop)
      return accumulator + pre if stop == ''
      yield accumulator + pre + stop
      regroup('', rest, &block)
    end
  end
end
