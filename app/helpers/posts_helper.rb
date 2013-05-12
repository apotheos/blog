module PostsHelper
  class PygmentizeHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygmentize.process(code, language)
    end
  end

  @redcarpet_options = {
      autolink: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks:true,
      no_intra_emphasis: true,
      space_after_headers: true,
      strikethrough:true,
      superscript: true,
      tables: true,
      underline: true
  }

  def markdown(text)
    @redcarpet = Redcarpet::Markdown.new(PygmentizeHTML, {fenced_code_blocks: true}) unless @redcarpet
    @redcarpet.render text
  end
end
