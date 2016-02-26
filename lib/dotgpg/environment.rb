require "dotgpg/environment/version"
require "dotgpg"
require "dotenv"

class Dotgpg
  class Environment < Dotenv::Environment
    def read
      # use dotgpg here
      dir = Dotgpg::Dir.closest(@filename)

      fail "not in a dotgpg directory" unless dir

      # if the file's not there assume we're creating a new one and return an
      # empty string
      return '' unless File.exists? @filename

      # make a new stringio object to pass in
      s = StringIO.new
      dir.decrypt @filename, s
      # have to rewind, otherwise read doesn't work
      s.rewind
      s.read
    end

    def write
      # use dotgpg here
      dir = Dotgpg::Dir.closest(@filename)

      fail "not in a dotgpg directory" unless dir
      # make a new stringio object to pass in
      s = StringIO.new

      sort.each do |k,v|
        # if our value has newlines or #'s it needs to be double-quoted. in
        # addition newlines need to be \n and not actual multi-line strings,
        # see https://github.com/bkeepers/dotenv#usage
        v = v.inspect if v.to_s.match(/\n|#/)
        s.write "#{k}=#{v}\n"
      end

      s.rewind
      dir.encrypt @filename, s
    end
  end
end
