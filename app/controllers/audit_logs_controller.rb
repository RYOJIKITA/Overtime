class AuditLogsController < ApplicationController
	def index
		@audit_logs = AuditLog.all
		# pundit method
		authorize @audit_logs
	end
end
