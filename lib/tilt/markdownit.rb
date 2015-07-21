require 'tilt/template'
require 'motion-markdown-it'

module Tilt
  # MarkdownIt Markdown implementation. See:
  # https://github.com/digitalmoksha/motion-markdown-it
  class MarkdownItTemplate < Template
    def prepare
      @engine = MarkdownIt::Parser.new(:commonmark)
      @output = nil
    end

    def evaluate(scope, locals, &block)
      @output ||= @engine.render(data)
    end

    def allows_script?
      false
    end
  end
end

