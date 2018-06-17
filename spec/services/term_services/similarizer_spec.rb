# frozen_string_literal: true

require "rails_helper"

module TermServices
  RSpec.describe Similarizer do
    let(:term) { create :term }

    shared_examples "a worked version of Similarizer" do
      describe "#call" do
        subject { described_class.new term }
        it { is_expected.to respond_to :call }
        it { expect { subject.call }.not_to raise_error }
      end

      describe ".new" do
        subject { described_class }
        it { is_expected.to respond_to :new }
        it { expect { subject.new term }.not_to raise_error }
      end
    end

    include_examples "a worked version of Similarizer"

    context "when term is japanese" do
      let(:term) { create :term, term: "日本" }
      it_behaves_like "a worked version of Similarizer"
    end
  end
end
