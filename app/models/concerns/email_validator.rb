class EmailValidator < ActiveModel::EachValidator

  COMPANY_EMAIL_REGEX = /^[a-zA-Z0-9._%+-]+@getmainstreet\.com/

  def validate_each(record, attribute, value)
    record.errors.add(attribute, "is invalid") unless value =~ COMPANY_EMAIL_REGEX
  end
end
