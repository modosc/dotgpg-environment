require "dotgpg/environment/version"
require "dotgpg"
require "dotenv"

class Dotgpg
  class Environment < Dotenv::Environment
    def read
      # use dotgpg here
      dir = Dotgpg::Dir.closest(@filename)

      fail "not in a dotgpg directory" unless dir
      # make a new stringio object to pass in
      s = StringIO.new
      dir.decrypt @filename, s
      # have to rewind, otherwise read doesn't work
      s.rewind
      s.read
    end
  end
end
