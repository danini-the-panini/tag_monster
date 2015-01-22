require 'spec_helper'

describe TagMonster::Element do
  describe '#each_element' do
    it 'yields for each child element' do
      input = StringIO.new '<root><entity></entity><entity></entity></root>'
      element = TagMonster.load_doc input

      expect { |b|
        element.each_element('/root/entity', &b)
      }.to yield_control.twice
    end
  end

  describe '#extract' do
    it 'extracts data from elements' do
      input = StringIO.new '
        <root>
          <entity>
            <name>Foo</name>
          </entity>
          <entity>
            <name>Bar</name>
          </entity>
        </root>'
      element = TagMonster.load_doc input

      data = element.extract names: '/root/entity/name'

      expect(data[:names]).to eq ['Foo', 'Bar']
    end
  end

  describe '#attributes' do
    it 'is a hash of attributes' do
      input = StringIO.new '<root foo="bar"></root>'

      element = TagMonster.load_doc input

      expect(element.attributes['foo']).to eq 'bar'
    end
  end
end
