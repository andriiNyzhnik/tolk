require 'kaminari'
require 'ya2yaml'
require 'tolk/engine'
require 'tolk/sync'
require 'tolk/import'

module Tolk
  mattr_accessor :table_name_prefix
  @@table_name_prefix = "tolk_"

  mattr_accessor :primary_locale_name
  @@primary_locale_name = I18n.default_locale.to_s

  def self.setup
    yield self
  end
end
