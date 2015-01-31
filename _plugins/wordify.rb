module Jekyll
  module Wordify
    def wordify(string)
      words = string.gsub(/[-_]/, ' ').split ' '
      words.map(&:capitalize!)
      words.join ' '
    end
  end
end

Liquid::Template.register_filter(Jekyll::Wordify)
