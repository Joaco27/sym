module LinksHelper
  def link_url(link)
    "#{root_url}l/#{link.slug}"
  end

end
