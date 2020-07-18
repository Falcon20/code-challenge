class Company < ApplicationRecord
  has_rich_text :description

  validates :email, email: true, if: Proc.new { email.present? }

  validates_presence_of :name, :zip_code

  validates :zip_code, length: {minimum: 5, maximum: 5}

  before_save :set_city_and_state, if: Proc.new { |t| t.changes.include?('zip_code') }

  def set_city_and_state
    location_hash = ZipCodes.identify(self.zip_code)

    if location_hash.present?
      self.state = location_hash[:state_name]
      self.city = location_hash[:city]
    else
      self.errors.add(:zip_code, 'is invalid. Kindly enter a valid zip code.')
      raise ActiveRecord::RecordInvalid.new(self)
    end

  end

end
