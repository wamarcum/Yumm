module ActiveRecord
	class SessionStore
		class Session
			def loaded_with_permanent_record?
				loaded_without_permanent_record? || respond_to?(:deleted_at) && deleted_at.present?
			end
 
			alias_method_chain :loaded?, :permanent_record
		end
	end
end
