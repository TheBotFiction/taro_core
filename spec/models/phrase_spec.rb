# frozen_string_literal: true

require "rails_helper"

RSpec.describe Phrase, type: :model do
  describe "associations" do
    it { should have_and_belong_to_many :terms }
  end

  describe ".new" do
    it { expect(described_class).to respond_to :new }
  end

  describe ".create" do
    it { expect(described_class).to respond_to :create }
    it do
      action = -> { described_class.create(build(:phrase).attributes) }
      behavior = -> { described_class.count }
      expect { action.call }.to change { behavior.call }.by 1
    end
    it "creates corresponding term along" do
      action = -> { described_class.create(build(:phrase).attributes) }
      behavior = -> { Term.count }
      expect { action.call }.to change { behavior.call }.by 4
    end
    it "does not create term when analyzed result is nil" do
      allow_any_instance_of(PhraseAnalyzer).to receive(:terms).and_call_original
      allow_any_instance_of(PhraseAnalyzer).to receive(:terms) { nil }
      action = -> { described_class.create(build(:phrase).attributes) }
      behavior = -> { Term.count }
      expect { action.call }.not_to change { behavior.call }
    end
  end

  describe ".find" do
    let(:record) { create :phrase }
    it { expect(described_class).to respond_to :find }
    it { expect(described_class.find(record.id)).to eq record }
  end

  describe "#save" do
    subject { build :phrase }
    it { is_expected.to respond_to :save }
    it { expect { subject.save }.to change { described_class.count }.by 1 }
    it { expect { subject.save }.to change { Term.count }.by 4 }
    it_behaves_like "shufflable"
    it "does not create duplicate terms" do
      record = subject.dup
      expect { record.save }.to change { Term.count }.by 4
      expect { subject.save }.not_to change { Term.count }
      expect(subject.terms).to eq(record.terms)
    end
  end

  describe "#update" do
    subject { create :phrase }
    it { is_expected.to respond_to :update }
    it { expect(subject.update(term: "World")).to be_truthy }
  end

  describe "#destroy" do
    let!(:record) { create :phrase }
    subject { record }
    it { is_expected.to respond_to :destroy }
    it { expect { subject.destroy }.to change { described_class.count }.by(-1) }
    it { expect { subject.destroy }.not_to change { Term.count } }
  end
end
