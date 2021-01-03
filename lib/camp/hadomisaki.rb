module Camp
  module Hadomisaki
    class << self
      def name
        "Hadomisaki"
      end

      def possible_days(doc)
        doc.xpath('//a').map {|element| element["href"]}.compact.map do |link|
          if link =~ /autocamp.*startdate/
            DateTime.parse(link.gsub(/.*startdate=([0-9]{4}-[0-9]{2}-[0-9]{2}).*/, '\1'))
          end
        end.compact
      end

      def url
        'https://www.hadomisaki-camp.jp/reservation/calendar/'
      end

      def sites
        ["", %q(?next=1&period=1#container)].map do |param|
          charset = 'utf-8'
          html = URI.open(url + param) { |f| f.read }
          doc = Nokogiri::HTML.parse(html, nil, charset)
          ::Camp::Site.new(name, possible_days(doc))
        end
      end
    end
  end
end
