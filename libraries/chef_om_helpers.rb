class Chef
  class Provider


    def copy_attributes(new_resource, current_resource)

      ignoreivs = [
        :@name, :@run_context, :@noop, :@before, :@params, :@provider,
        :@allowed_actions, :@action, :@updated, :@updated_by_last_action,
        :@supports, :@ignore_failure, :@retries, :@retry_delay, :@not_if,
        :@only_if, :@source_line, :@guard_interpreter, :@default_guard_interpreter,
        :@elapsed_time, :@sensitive, :@resource_name, :@declared_type, :@cookbook_name,
        :@recipe_name, :@enclosing_provider
      ]

      myivs = new_resource.instance_variables
      myivs -= ignoreivs

      myivs.each do |iv|
        current_resource.send(iv.to_s.delete('@').to_sym, new_resource.instance_variable_get(iv.to_s))
        Chef::Log.info("Set instance variable for: #{iv}")
      end
    end


  end
end
