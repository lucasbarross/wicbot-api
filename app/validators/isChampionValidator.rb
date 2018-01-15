class isChampionValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if invalid(value)
        record.errors[attribute] << 'Invalid champion.'
      end
    end

    def invalid(value)
        str = value.split(' ').join
        if(open("http://ddragon.leagueoflegends.com/cdn/6.24.1/img/champion/" + str +".png"))
            return true
        return false
    end
  end