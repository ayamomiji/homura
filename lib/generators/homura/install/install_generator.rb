module Homura
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_locale_file
      template 'layout.en.yml.erb', 'config/locales/layout.en.yml'
    end

    def copy_layout_file
      copy_file 'application.html.slim',
                'app/views/layouts/application.html.slim'
    end

    def app_name
      Rails.root.split.last.to_s.titleize
    end
  end
end
