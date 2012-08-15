# This module will add mobile device detection support.
#
# It makes mobile and desktop to share the same controller, the same url,
# but different templates.
#
# It will store current status in cookie[mobile].
#
# Client may pass mobile=0|1 to any url to modify the cookie.
#
# Server will serve templates in app/mobile_views rather than app/views
# if requested templates available.
#
# References:
# http://erniemiller.org/2011/01/05/mobile-devices-and-rails-maintaining-your-sanity/
# http://johannburkard.de/blog/www/mobile/simple-mobile-phone-detection.html
module Homura
  module MobileDetection
    MOBILE_USER_AGENTS = /(IEMobile|Windows CE|NetFront|PlayStation|
                           PLAYSTATION|like Mac OS X|MIDP|UP\.Browser|
                           Symbian|Nintendo|Android)/x

    def self.included(base)
      base.class_eval do
        before_filter :set_mobile_preferences
        before_filter :prepend_view_path_if_mobile

        helper_method :mobile_request?
        helper_method :mobile_browser?
      end
    end

    def set_mobile_preferences
      case params[:mobile]
      when '1'
        cookies['mobile'] = '1'
        redirect_to_current_page_without_mobile_param
      when '0'
        cookies['mobile'] = '0'
        redirect_to_current_page_without_mobile_param
      else
        cookies['mobile'] ||= mobile_browser? ? '1' : '0'
      end
    end

    def prepend_view_path_if_mobile
      if mobile_request?
        prepend_view_path Rails.root + 'app/mobile_views'
      end
    end

    def redirect_to_current_page_without_mobile_param
      path = request.fullpath.gsub(/mobile=[01]&?/, '').chomp('?')
      full_url = request.protocol + request.host_with_port + path
      redirect_to full_url
    end

    def mobile_request?
      cookies['mobile'] == '1'
    end

    def mobile_browser?
      request.env['HTTP_USER_AGENT'] &&
        request.env['HTTP_USER_AGENT'][MOBILE_USER_AGENTS]
    end
  end
end
