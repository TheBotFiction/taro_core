# frozen_string_literal: true

require "rails_helper"

RSpec.describe MasterTermImporter do
  let!(:json) { "[{\"id\":\"143993\",\"group\":\"1\",\"word\":\"会う\",\"phonetic\":\"あう\",\"mean\":\"gặp, \"}]" }

  describe ".new" do
    it { expect(described_class).to respond_to :new }
    it do
      action = -> do
        described_class.new "file.json", "high"
      end
      expect { action.call }.not_to raise_error
    end
  end

  describe "#call" do
    it do
      allow(File).to receive(:read).and_call_original
      allow(File).to receive(:read).with("file.json").and_return(json)
      action = -> do
        service = described_class.new("file.json", "A")
        service.call
      end
      behavior = -> { M::Term.count }
      expect { action.call }.to change { behavior.call }.by(1)
    end
  end
end
