class isChampionValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if invalid(value)
        record.errors[attribute] << 'Invalid champion.'
      end
    end

    def invalid(value)
        begin
          str = value.split(' ')
          str.each_with_index{ |name, index| str[index] = name.capitalize}
          str.join
          open("http://ddragon.leagueoflegends.com/cdn/7.10.1/img/champion/" + str +".png"))
          return true
        rescue Exception => e
          return false
        end
    end
  end