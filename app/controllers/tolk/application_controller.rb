module Tolk
  class ApplicationController < ActionController::Base
    helper :all
    protect_from_forgery
    before_filter :authenticate

    def authenticate
      Tolk.authenticator.bind(self).call if Tolk.authenticator && Tolk.authenticator.respond_to?(:call)
    end

    def ensure_no_primary_locale
      redirect_to tolk.locales_path if @locale.primary?
    end
  end
end
