require 'flipper/cli'

class WebCli < Flipper::CLI
  def load_environment!
    # already loaded, so no need
  end

  def run(...)
    original_stdout = $stdout
    original_stderr = $stderr

    output = StringIO.new
    # Prentend this a TTY so we get colorization
    def output.tty?
      true
    end

    $stdout = output
    $stderr = output
    status = 0

    begin
      super(...)
    rescue SystemExit => e
      status = e.status
    end

    [status, output.string]
  ensure
    $stdout = original_stdout
    $stderr = original_stderr
  end
end
