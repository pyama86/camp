require 'date'
require 'camp/site'
require 'camp/montbell'
require 'camp/hadomisaki'
require 'nokogiri'
require 'open-uri'

module Camp
  def self.can_reserve_sites(day)
    raise "input parameter must be Date class" if day.class != Date

    %w(Montbell Hadomisaki).map do |s|
      sites = Object.const_get("Camp::#{s}").sites
      sites.map do |site|
        site.name if site.possible_days.find {|pd| pd == day}
      end.compact
    end.compact.flatten
  end
end
