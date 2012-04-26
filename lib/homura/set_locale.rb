module Homura
  module SetLocale
    extend ActiveSupport::Concern

    included do
      before_filter :set_locale
    end

    def available_locales
      @available_locales ||= I18n.available_locales.map(&:to_s)
    end

    def set_locale
      if params['locale'] && available_locales.include?(params['locale'])
        cookies.permanent['locale'] = locale
        I18n.locale = locale and return
      end

      if cookies['locale'] && available_locales.include?(locale)
        I18n.locale = locale and return
      end

      http_accept_language = request.headers['HTTP_ACCEPT_LANGUAGE'] || ''
      preferred_locales = http_accept_language.split(',').map { |l|
        l.split(';').first
      }
      I18n.locale = preferred_locales.find { |l|
        available_locales.include?(l)
      }
    end
  end
end
