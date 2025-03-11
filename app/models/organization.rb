class Organization < ApplicationRecord
  has_many :circles, foreign_key: 'organization_id'

  # NOTE: self = instance that's calling the method
  def assign_url_token
    self.url_token = generate_token
  end

  # Returns a *unique* url_token
  def generate_token
    new_token = [*('a'..'z'), *('0'..'9')].sample(16).join while Organization.url_tokens.include? new_token
    new_token
  end

  # Returns all existing url_tokens
  # NOTE: 'def self.method' is a method of the class Organization
  def self.url_tokens
    # NOTE: The following line is equal to 'Organization.all.map { |o| o.url_token }'
    Organization.all.map(&:url_token) # => [token_1, token_2, ...]
  end

  # NOTE: to_param ensures that url_token is used (instead of id) in routes
  def to_param
    url_token
  end

  # alias_method :id, :url_token
end
