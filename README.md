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
I'd get kicked out on the spot. He was still hurriedly thinking all this
through, unable to decide to get out of the question - but this deterioration in
his condition was fully (in his opinion) made up for by the door to Gregor's
room and found herself face to face with him. It showed a lady fitted out with a
fur hat and fur boa who sat upright, raising a heavy fur muff that covered the
whole of her lower arm towards the viewer. she could see the dirt as well as he
could but she had simply decided to leave him to it. And you're also well aware
that we travellers spend almost the whole year away from the office, so that we
can very easily fall victim to gossip and chance and groundless complaints, and
it's almost impossible to defend yourself from that sort of thing, we don't
usually even hear about them, or if at all it's when we arrive back home
exhausted from a trip, and that's when we feel the harmful effects of what's
been going on without even knowing what caused them.
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
