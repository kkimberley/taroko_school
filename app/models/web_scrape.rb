class WebScrape
  attr_reader :img, :favicon, :title, :subtitle, :description, :url

  def initialize(page)
    url_split = page.title.split(/: /)[0].split(/- /)
    markdown = Redcarpet::Markdown.new(MdEmoji::Render, no_intra_emphasis: true)

    @img = page.images.best
    @favicon = page.images.favicon
    @title = url_split[0]
    @subtitle = url_split[1]
    @description = markdown.render(page.description).html_safe
    @url = page.url
  end
end
