module Gendalf 
  
  class WizardModel
    include ActiveModel::Validations
    include ActiveModel::Serialization
  
    attr_accessor :step
  
    def merge_step!(step_model)
      step_model.class.step_attributes.each do |attrib|
        send("#{attrib}=", step_model.send(attrib))
      end
    end
  
    class << self    
      # Defines a step
      def define_step(step_no, step_attributes, &validations_block)
        define_attributes step_attributes
      
        @steps ||= []
        @steps[step_no] = step_model_class(step_no, step_attributes, &validations_block)
      end
    
      def define_null_step(step_no)
        define_step step_no, [] do
        end
      end

      alias_method :define_final_step, :define_null_step
    
      def steps
        @steps
      end

    private
      # Defines steps attributes.
      def define_attributes(step_attributes)
        [*step_attributes].each do |attrib|
          instance_eval do
            attr_accessor attrib.to_sym
          end
        end
      end
    
      # Create a step model class (used for validations and holding intermediate step values)
      def step_model_class(step_no, step_attributes, &validations_block)
        step_model_class = Class.new
      
        # make its name accessible to itself
        step_model_class.instance_variable_set :@name, "#{self.name}_#{step_no}_Step"
        # ... and save step attributes for future merging
        step_model_class.instance_variable_set :@step_attributes, [*step_attributes]
      
        # make it an proper ActiveModel
        step_model_class.instance_eval do
          include ActiveModel::Validations
          include ActiveModel::Serialization
          include ActiveModel::Conversion
        
          def name; @name; end
          def step_attributes; @step_attributes; end
        end
      
        step_model_class.class_eval do
          def initialize(attributes = {})
            return unless attributes.kind_of? Hash
            attributes.each do |name, value|  
              send("#{name}=", value)  
            end  
          end
        
          def persisted?
            false
          end
        end
      
        # define appropriate attributes for the step
        [*step_attributes].each do |attrib|
          step_model_class.instance_eval do
            attr_accessor attrib.to_sym
          end
        end  
      
        # give user a chance to add the validations
        step_model_class.instance_eval(&validations_block)
      
        return step_model_class
      end
    end  
  end

end