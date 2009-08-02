require_dependency 'projects_helper'

module ProjectstreeviewProjectsHelperPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)

    base.send(:include, InstanceMethods)
  end
  
  module ClassMethods
  end
  
  module InstanceMethods
    
    ###
    # Compatibility helpers
    ###
    
    # Redmine Core trunk@r2734 (0.9-devel)
    # Returns true if the method is defined, else it returns false
    def users_by_role_implemented
      return ProjectsController.method_defined?("users_by_role")
    end

    # Redmine Core trunk@r2750 (0.9-devel)
    # Returns true if the method is defined, else it returns false
    def authorize_global_implemented
      return ApplicationController.method_defined?("authorize_global")
    end

  end # Close the module ProjectstreeviewProjectsHelperPatch::InstanceMethods
end # Close the module ProjectstreeviewProjectsHelperPatch
