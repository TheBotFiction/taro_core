# frozen_string_literal: true

require "rails_helper"

module TaroCore
  RSpec.describe "VERSION" do
    it do
      expect(TaroCore::VERSION).to eq("0.1.0")
    end
  end
end
