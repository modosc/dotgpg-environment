require 'spec_helper'
require 'gpgme'
describe Dotgpg::Environment do
  FIXTURES_DIR ||= File.expand_path("../../fixtures", __FILE__)

  before(:context) do
    # scary! who knows what keys i'm dropping into your system here.
    Dir[File.join FIXTURES_DIR, 'keys', "*"].each{|f| GPGME::Key.import File.open f}
  end

  # hard code this because i don't see a programmatic way to get it from the
  # GPG::Key.import calls above
  GPG_KEY ||= '3F8D3012'.freeze

  after(:context) do
    # delete the above keys.
    GPGME::Key.find(:secret, GPG_KEY).first.delete! true
  end

  it 'has a version number' do
    expect(Dotgpg::Environment::VERSION).not_to be nil
  end

  it 'loads dotgpg-encrypted files correctly' do
    expect(Dotgpg::Environment.new File.join FIXTURES_DIR, 'config/dotgpg/test.gpg').to eq({"FOO"=>"bar", "BAZ"=>"bat"})
  end

end
