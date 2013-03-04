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
      if (param_locale = params['locale']) && locale_available?(param_locale)
        cookies.permanent['locale'] = param_locale
        I18n.locale = param_locale and return
      end

      if (cookie_locale = cookies['locale']) && locale_available?(cookie_locale)
        I18n.locale = cookie_locale and return
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
