module Homura
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_locale_file
      copy_file 'layout.en.yml', 'config/locales/layout.en.yml'
    end

    def copy_layout_file
      copy_file 'application.html.slim',
                'app/views/layouts/application.html.slim'
    end
  end
end
