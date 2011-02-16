Gendalf wizard helper gem
=========================

Makes it easier to add wizard-like behaviour to your application.

[Make yourself] an example
==========================

1. Connect Gendalf wizardry gem to your application:

    gem 'gendalf'

2. Create the source files in your project:

custom_wizard_controller.rb
---------------------------

    class CustomWizardController < Gendalf::WizardController
      layout "application"
      set_model_name :user_info
  
      def step0
      end
    
      def step1
      end
  
      def step2
        @user_info = session[:user_info]
      end
  
    protected
      def wizard_model
        session[:user_info] ||= UserInfo.new
      end  

      def current_step
        session[:current_step] ||= 0
      end
  
      def current_step=(step)
        session[:current_step] = step
      end
    end

user_info.rb
------------

    class UserInfo < Gendalf::WizardModel
      define_step 0, :name do
        validates_presence_of :name
      end
  
      define_step 1, :surname do
        validates_presence_of :surname
      end
  
      define_final_step 2
    end

3. Add the route:

    wizard 'wizard', :custom_wizard, 3

4. Launch the application and navigate to http://localhost:3000/wizard/ .

Get a working example
==========================

1. Clone the repository:http://github.com/SkyWriter/Gendalf-Demo : git://github.com/SkyWriter/Gendalf-Demo.git .

2. Run bundler.

3. Launch the application and navigate to http://localhost:3000/wizard/ .
