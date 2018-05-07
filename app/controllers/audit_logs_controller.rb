class AuditLogsController < ApplicationController
	def index
		@audit_logs = AuditLog.page(params[:page]).per(10)
		# pundit method
		authorize @audit_logs
	end
end
