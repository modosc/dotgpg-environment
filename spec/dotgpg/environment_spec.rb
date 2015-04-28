require 'spec_helper'
require 'gpgme'
describe Dotgpg::Environment do

  it 'has a version number' do
    expect(Dotgpg::Environment::VERSION).not_to be nil
  end

  it 'loads dotgpg-encrypted files correctly' do
    expect(Dotgpg::Environment.new $dotgpg + 'test.gpg').to eq({"FOO"=>"bar", "BAZ"=>"bat"})
  end

end
