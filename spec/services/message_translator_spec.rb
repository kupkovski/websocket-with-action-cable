require 'rails_helper'

RSpec.describe MessageTranslator do
  pending "add some examples to (or delete) #{__FILE__}"

  subject { described_class.new('all you need is love', 'yoda') }
  let(:mock_doc) { double(:mock_doc) }

  it 'must call the external url and parse it on  something' do
    expected_url = "http://www.degraeve.com/cgi-bin/babel.cgi?d=yoda&w=all+you+need+is+love"
    expect(subject).to receive(:open).with(expected_url).and_return(StringIO.new)
    expect(subject.translate).to eq ''
  end
end
