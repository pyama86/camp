module Camp
  module Montbell
    class Base
      def site_name
        raise 'site_name required'
      end

      def url
        raise 'url required'
      end

      def possible_days(doc)
        doc.xpath('//a').map {|element| element["href"]}.compact.map do |link|
          if link =~ /start_date/
            DateTime.parse(link.gsub(/.*start_date=/, ''))
          end
        end.compact
      end
    end
  end
end
