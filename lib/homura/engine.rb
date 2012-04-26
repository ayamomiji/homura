module Homura
  class Engine < Rails::Engine
    initializer 'homura' do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.helper LayoutHelper
      end
    end
  end
end
