require 'spec_helper'
require 'gpgme'
RSpec.describe Dotgpg::Environment do
  let(:file) { $dotgpg + 'test.gpg' }
  let(:new_file) { $dotgpg + 'asdf.gpg'}

  it 'has a version number' do
    expect(Dotgpg::Environment::VERSION).not_to be nil
  end

  describe '#read' do
    it 'loads dotgpg-encrypted files correctly' do
      expect(Dotgpg::Environment.new file).to eq({"FOO"=>"bar", "BAZ"=>"bat"})
    end
  end

  describe '#write' do
    after(:each) { File.unlink new_file }
    it 'works' do
      # open up a new file
      e = Dotgpg::Environment.new new_file
      expect(e).to eq({})

      # set something
      e['FOO'] = "BAR"

      # and write it
      expect{ e.write }.to change{ File.exists? new_file }.from(false).to(true)

      # now try to load up our file
      f = Dotgpg::Environment.new new_file
      expect(f).to eq(e)
    end
  end

end
