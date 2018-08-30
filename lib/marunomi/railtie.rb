module Marunomi
  class Railtie < Rails::Railtie
    initializer 'marunomi' do |app|
      ActiveSupport.on_load :action_view do
        require 'my_plugin/view_helpers/action_view'
      end
    end
  end
end