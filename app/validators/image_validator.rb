class ImageValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value.attached?
  
      record.errors.add(attribute, :blank, message: "画像が必要です")
    end
  end
  