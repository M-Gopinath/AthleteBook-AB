module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
  end

  def errors_full_msg(h)
      h.collect {|k, v| k.to_s.humanize + ' ' +  v.first }
  end
end
