# frozen_string_literal: true

require "rails_helper"

module TermServices
  RSpec.describe Randomizer do
    describe "#call" do
      subject { described_class.new }
      it { is_expected.to respond_to :call }
      it { expect { subject.call }.not_to raise_error }
      it do
        create :term
        subject.call
        expect(subject.term).to be_a Term
      end
    end

    describe "#term" do
      subject { described_class.new }
      it { is_expected.to respond_to :term }
    end

    describe ".new" do
      subject { described_class }
      it { is_expected.to respond_to :new }
      it { expect { subject.new }.not_to raise_error }
    end

    describe ".call" do
      subject { described_class }
      it { is_expected.to respond_to :call }
      it { expect { subject.call }.not_to raise_error }
    end
  end
end
