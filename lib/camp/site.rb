module Camp
  class Site
    attr_reader :name, :possible_days
    def initialize(name, possible_days)
      @name = name
      @possible_days = possible_days
    end

    def can_researve?(day)
      possible_days.find? {|d| d == day}
    end
  end
end
