require 'flipper/cli'

class WebCli < Flipper::CLI
  def self.run(input)
    args = Shellwords.split(input.to_s)
    status = 0
    output = StringIO.new

    # Prentend this a TTY so we get colorization
    def output.tty?
      true
    end

    cli = new(stdout: output, stderr: output)

    begin
      cli.run(args)
    rescue SystemExit => e
      status = e.status
    end

    [status, output.string]
  end

  def load_environment!
    # already loaded, so no need
  end
end
