class Website < ApplicationRecord
  VALID_URL_REGEX = /\A#{URI::regexp(['http', 'https'])}\z/

  validates(:name, presence: true)
  validates(:url, presence: true, format: { with: VALID_URL_REGEX })

  default_scope { active }
  scope(:active, -> { where(active: true) })
end