require 'camp/montbell/base'
require 'camp/montbell/b_site'
require 'camp/montbell/c_site'
require 'camp/montbell/wall_site'

module Camp
  module Montbell
    SITES = %w(Bsite Csite)
    def self.sites
      charset = 'utf-8'
      SITES.map do |s|
        site = Object.const_get("Camp::Montbell::#{s}").new
        html = URI.open(site.url) { |f| f.read }
        doc = Nokogiri::HTML.parse(html, nil, charset)
        ::Camp::Site.new(site.site_name, site.possible_days(doc))
      end
    end
  end
end
