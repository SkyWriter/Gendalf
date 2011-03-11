module Gendalf 
  
  class WizardController < ActionController::Base
    protect_from_forgery
    
    before_filter :redirect_to_current_step
  
    def model
      @@model_name.to_s.camelize.constantize.steps[step_no]
    end
    
    def step
      load_current_step
      send step_action_name
      render :action => step_action_name
    end
  
    def step_submit
      if proceed_custom_or_default_step_submit
        if respond_to?(step_action_name(step_no+1))
          self.current_step = step_no+1
          redirect_to wizard_path(self.current_step)
        end
      else
        render :action => step_action_name
      end
    end
  
    class << self
      def set_model_name(model_name)
        @@model_name = model_name
      end
    
      def model_name
        @@model_name
      end
    end
  
    def default
      redirect_to custom_wizard_path(current_step)
    end
  
  protected
  
    def load_current_step
      @wizard_model = wizard_model
      @step = model.new(params[param_name] || wizard_model)
    end

    def wizard_model
      raise "Please, implement 'wizard_model' method in #{self.class.name}"
    end
  
    def current_step
      raise "Please, implement 'current_step' method in #{self.class.name}"
    end

    def current_step=(step)
      raise "Please, implement 'current_step=' method in #{self.class.name}"
    end
  
    def wizard_path(step)
      send("#{self.class.name.gsub('Controller', '').underscore}_path", :step => step+1)
    end  

  private

    def redirect_to_current_step
      if /^step\d*(|_submit)/.match(params[:action]) && step_no != current_step
        redirect_to wizard_path(current_step)
      end
    end
  
    def param_name
      model.name.underscore
    end

    def proceed_custom_or_default_step_submit
      respond_to?("#{step_action_name}_submit") ? 
        send("#{step_action_name}_submit") :
        default_step_submit
    end

    def default_step_submit
      @step = model.new(params[param_name])
      if @step.valid?
        wizard_model.merge_step!(@step)
        true
      else
        flash[:error] = @step.errors.full_messages
        false
      end
    end

    def step_no
      if params[:step].nil?
        session[:current_step]
      else
        params[:step].to_i-1
      end
    end

    def step_action_name(action_step_no=nil)
      "step#{action_step_no || step_no}"
    end
  end

end
