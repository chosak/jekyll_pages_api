require_relative 'filters'

module JekyllPagesApi
  # wrapper for a Jekyll::Page
  class Page
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def html?
      %w(.html .md).include?(self.page.ext)
    end

    def filterer
      @filterer ||= Filters.new
    end

    def title
      self.filterer.decode_html(self.page.data['title'] || '')
    end

    def body_text
      self.filterer.text_only(self.page.content)
    end

    def to_json
      {
        title: self.title,
        url: page.url,
        body: self.body_text
      }
    end
  end
end
