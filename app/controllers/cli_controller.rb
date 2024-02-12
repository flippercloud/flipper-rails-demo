class CliController < ApplicationController
  def execute
    @status, @output = WebCli.run(params[:prompt])
    render layout: false ## FIXME: render full page if not xhr
  end
end
