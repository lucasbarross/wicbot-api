class EmojiValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if invalid(value)
        record.errors[attribute] << 'Invalid emoji.'
      end
    end

    def invalid(value)
        value = value.strip
        if value[0] != ':' || value[value.length-1] != ':'
            return true
        end
        return false
    end
  end