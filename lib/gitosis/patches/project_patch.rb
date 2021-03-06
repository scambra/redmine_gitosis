require_dependency 'project'
module Gitosis
  module Patches
    module ProjectPatch
    	
      def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)
        base.class_eval do
          alias_method_chain :close, :gitosis
          alias_method_chain :reopen, :gitosis
        end
      end	
			
      module InstanceMethods
        def close_with_gitosis
          close_without_gitosis
          Gitosis::update_repositories self_and_descendants.status(Project::STATUS_CLOSED).to_a
        end
		    
        def reopen_with_gitosis
          reopen_without_gitosis
          Gitosis::update_repositories self_and_descendants.status(Project::STATUS_ACTIVE).to_a
        end
      end
    end
  end
end

Project.send(:include, Gitosis::Patches::ProjectPatch) unless Project.include?(Gitosis::Patches::ProjectPatch)
