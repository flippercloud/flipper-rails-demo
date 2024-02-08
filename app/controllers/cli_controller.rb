class CliController < ApplicationController
  def execute
    args = Shellwords.split(params[:prompt].to_s)
    @status, @output = WebCli.run(args)
    render layout: false ## FIXME: render full page if not xhr
  end
end
