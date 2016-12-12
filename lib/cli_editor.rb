require "cli_editor/version"
require "tempfile"

class CLIEditor
  BadFormatError = Class.new StandardError
  def initialize(cmd = 'vim')
    @cmd = cmd
  end
  def edit(str)
    tf = Tempfile.new
    tf.write str
    tf.close
    system @cmd, tf.path
    tf.open
    data = tf.read
    tf.close
    tf.unlink
    data
  end
end
