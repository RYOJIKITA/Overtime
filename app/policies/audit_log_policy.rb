class AuditLogPolicy < ApplicationPolicy

	def update?
		return true if post_approved? && admin?
		return true if user_or_admin && !post_approved?
	end

	def index?
		return true if admin?
		
	end

	private
		def admin?
			admin_types.include?(user.type)
		end
end