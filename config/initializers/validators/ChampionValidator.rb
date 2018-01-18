require 'open-uri'

class ChampionValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if invalid(value)
        record.errors[attribute] << 'Invalid champion.'
      end
    end

    def invalid(value)
        begin
          str = value.split(' ')
          str.each_with_index{ |name, index| str[index] = name.capitalize}
          str = str.join
          open("http://ddragon.leagueoflegends.com/cdn/7.10.1/img/champion/" + str +".png")
          return false
        rescue Exception => e
          puts e
          return true
        end
    end
  end