require 'flipper/cli'

class WebCli < Flipper::CLI
  def self.run(input)
    output = StringIO.new

    # Prentend this a TTY so we get colorization
    def output.tty?
      true
    end

    status = new(stdout: output, stderr: output).run(Shellwords.split(input.to_s))

    [status, output.string]
  end

  # Override to not exit and return default status of 0
  def run(args)
    super
    0
  rescue SystemExit => e
    e.status
  end

  def load_environment!
    # already loaded, so no need
  end
end
