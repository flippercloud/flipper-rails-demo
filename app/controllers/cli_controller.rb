class CliController < ApplicationController
  def execute
    @status, @output = WebCli.run(params[:prompt])
    render layout: false
  end
end
