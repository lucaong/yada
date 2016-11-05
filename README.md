# Yada

`Yada` trains a Markov chain model from some provided textual content, and uses
it to generate more text that resembles in style the provided one (but is mostly
nonsense).


## Usage

```ruby
yada = Yada.new
yada.train!(File.new('a_text_file.txt'))
yada.generate(10) # Generate 10 sentences
```

Example output, when trained on Franz Kafka's Metamorphosis:

```
It was just shrugged her to him. Then, and listen to talk at last glance he
would excuse their total despair, one arm around the cleaner had never to see
how Gregor needed a smart blue uniform cap in bed. He could not sleeping a
lieutenant in the task of the door and filled the chief clerk come and crying.
It seemed to him over at all around her left, Gregor's back out through the
contrary I mention this job and no-one had indeed cut off so stubborn; She was
already looked back comfortably on astonished and he lifted his sister were very
slowly.
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
