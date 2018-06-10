# frozen_string_literal: true

require "rails_helper"

RSpec.describe Safety do
  describe ".call" do
    it { expect(described_class).to respond_to :call }
    it "invokes the block" do
      behavior = spy
      described_class.call { behavior.call }
      expect(behavior).to have_received(:call)
    end
    it "prevents raising errors from block" do
      action = -> { described_class.call { fail "I must fail" } }
      expect { action.call }.not_to raise_error
    end
  end
end
