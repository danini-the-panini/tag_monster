require 'spec_helper'

describe TagMonster do
  describe '.load_doc' do
    it 'loads a new element' do
      input = '<root></root>'
      expect(TagMonster.load_doc input).to be_an TagMonster::Element
    end
  end
end
