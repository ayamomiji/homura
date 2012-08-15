module Homura
  module SetLocale
    extend ActiveSupport::Concern

    included do
      before_filter :set_locale
    end

    def available_locales
      @available_locales ||= I18n.available_locales.map(&:to_s)
    end

    def locale_available?(locale)
      available_locales.include?(locale)
    end

    def set_locale
      if params['locale'] && locale_available?(params['locale'])
        cookies.permanent['locale'] = locale
        I18n.locale = locale and return
      end

      if cookies['locale'] && locale_available?(locale)
        I18n.locale = locale and return
      end

      http_accept_language = request.headers['HTTP_ACCEPT_LANGUAGE'] || ''
      preferred_locales = http_accept_language.split(',').map { |l|
        l.split(';').first.downcase.gsub(/-[a-z0-9]+$/i) { |x| x.upcase }
      }
      I18n.locale = preferred_locales.find { |l|
        locale_available?(l)
      }
    end
  end
end
