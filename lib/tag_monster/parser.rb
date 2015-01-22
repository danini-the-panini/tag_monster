module TagMonster
  class Parser
    def initialize input
      @input = input
      @acc = ""
      @type = nil
    end

    def next_element
      tag = nil
      while tag.nil?
        c = @input.readchar
        process_char c do |t, type|
          process_tag t, type
          tag = TagMonster::Element.new input, self, tag, type
        end
      end
      tag
    end

    private

      def process_tag tag, type
        case type
        when :text
          TagMonster::TextElement.new tag
        when :tag

        end
      end

      def process_char c
        case c
        when '<'
          yield acc.strip, type if type == :text
          type = :tag
          acc = c
        when '>'
          acc += c
          yield acc.strip, type
          type = nil
          acc = ""
        else
          type ||= :text
          acc += c
        end
      end

      def match_opening_tag
        /<([a-zA-Z\-]+)(\s|(\s+.+?=(".+?"|'.+?')))*?>/
      end

      def match_closing_tag
        /<\/([a-zA-Z\-]+)\s*>/
      end

      def match_single_tag
        /<([a-zA-Z\-]+)(\s|(\s+.+?=(".+?"|'.+?')))*?\/\s*>/
      end

      def match_attribs
        /([a-zA-Z_-]+?)=['"](.*?)['"]/
      end

  end
end
