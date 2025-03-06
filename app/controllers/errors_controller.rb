class ErrorsController < ApplicationController
  def not_found
    head :not_found
  end

  def internal_server_error
    head :ok
  end
end
