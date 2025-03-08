class Organization < ApplicationRecord
  def assign_url_token(organization = self)
    organization.url_token = generate_token
  end

  # Returns a *unique* url_token
  def generate_token
    new_token = [*('a'..'z'), *('0'..'9')].sample(16).join while Organization.url_tokens.include? new_token
    new_token
  end

  # Returns all existing url_tokens
  def self.url_tokens
    # NOTE: The following line is equal to 'Organization.all.map { |o| o.url_token }'
    Organization.all.map(&:url_token) # => [token_1, token_2, ...]
  end

  # def to_param
  #   url_token
  # end

  # alias_method :id, :url_token
end
