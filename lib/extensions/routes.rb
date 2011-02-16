class ActionDispatch::Routing::Mapper
  def wizard(url, controller, total_steps)
    match "#{url}/step:step" => "#{controller.to_s.underscore}#step", :via => :get, :as => controller.to_s.underscore.to_sym
    match "#{url}/step:step" => "#{controller.to_s.underscore}#step_submit", :via => :post, :as => controller.to_s.underscore.to_sym
    match "#{url}" => "#{controller.to_s.underscore}#default", :via => :get


    model_prefix = "#{controller.to_s.camelcase}Controller".constantize.model_name.to_s.underscore    
    total_steps.times do |idx|
      match "#{url}/step#{idx+1}" => "#{controller.to_s.underscore}#step", :via => :get, :as => "#{model_prefix}_#{idx}_steps"
    end
  end
end
