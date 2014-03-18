class Translation < I18n::Backend::ActiveRecord::Translation
  belongs_to :user
end

class User < ActiveRecord::Base
  has_many :user_translations
end
