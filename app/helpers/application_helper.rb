module ApplicationHelper
	def home?
		params[:controller].eql?('home')
	end

	def account
		if user_signed_in?
			current_user.account_label
		else
			'Account'
		end
	end
end
