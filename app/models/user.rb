# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_token :api_key

  validates :name, presence: true, length: { maximum: 255 }
  validates :api_key, allow_nil: true,
                      allow_blank: false,
                      length: { minimum: 24, maximum: 255 },
                      format: { with: /\A[a-zA-Z0-9]{#{ActiveRecord::SecureToken::MINIMUM_TOKEN_LENGTH},}\z/o },
                      uniqueness: { case_sensitive: false }
end
