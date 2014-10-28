# Tag Monster!

Tag monster helps you extract information from enormous XML files without eating up all your memory and knocking your server over. It does this by going through the file one tag at a time without loading the whole thing in memory, so you can data mine the crap out of those massive XML files you got from who-knows-where.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tag_monster'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tag_monster

## Usage

Given this XML:

```xml
<root>
  <entity id="1">
    <name>Foo</name>
    <product>
      <price>100</price>
      <units>
        <unit>Bob</unit>
        <unit>Larry</unit>
      </units>
    </product>
  </entity>
  <entity id="2">
    <name>Bar</name>
    <product>
      <price>250</price>
      <units>
        <unit>Sally</unit>
      </units>
    </product>
  </entity>
  ...
</root>
```

And this ruby:

```ruby
doc = TagMonster::Document.new input_stream

doc.each_element '/root/entity' do |element|

  id = element.attributes['id']

  data = element.extract name: '/name', price: '/product/price', units: '/product/units/unit'

  name = data[:name][0]
  price = data[:price][0]
  units = data[:units]

end
```

You'll get the following values:

```ruby
id = "1"
name = "Foo"
price = "100"
units = ["Bob","Larry"]

id = "2"
name = "Bar"
price = "250"
units = ["Sally"]

...
```

## Limitations

Currently can only be used for simple XML processing.

## Contributing

  1. Fork it ( https://github.com/[my-github-username]/tag_remover/fork )
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create a new Pull Request
