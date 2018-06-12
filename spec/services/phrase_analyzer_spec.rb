# frozen_string_literal: true

require "rails_helper"

RSpec.describe PhraseAnalyzer do
  let(:phrase) { "String" }
  subject { described_class.new phrase }

  describe ".new" do
    it { expect(described_class).to respond_to :new }
    it { expect { described_class.new }.to raise_error ArgumentError }
    it { expect { described_class.new phrase }.not_to raise_error }
  end

  describe "#phrase" do
    it { is_expected.to respond_to :phrase }
    it { is_expected.not_to respond_to :phrase= }
    it { expect(subject.phrase).to eq phrase }
  end

  describe "#terms" do
    it { is_expected.to respond_to :terms }
    it { is_expected.not_to respond_to :terms= }
    it { expect(subject.terms).to be_nil }
  end

  describe "#call" do
    it { is_expected.to respond_to :call }

    context "when phrase is `検索`" do
      let(:phrase) { "検索" }
      let(:analyzer) { :morpheme }
      before do
        VCR.use_cassette("phrase-analyzer-#{analyzer}-#{phrase}") do
          subject.call
        end
      end

      shared_examples "a correct result of #call method" do
        it "returns non empty result" do
          expect(subject.terms).not_to be_empty
        end

        it do
          expect(subject.terms).to eq([{term: "検索", spelling: "けんさく", surface: "検索"}])
        end
      end

      it_behaves_like "a correct result of #call method"

      context "with `dependency` analyzer" do
        let(:analyzer) { :dependency }
        subject { described_class.new phrase, analyzer: analyzer }

        it "returns non empty result" do
          expect(subject.terms).not_to be_empty
        end
      end

      context "with unrecognized analyzer" do
        subject { described_class.new phrase, analyzer: :unrecognized }

        it_behaves_like "a correct result of #call method"
      end
    end
  end
end
