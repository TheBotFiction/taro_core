# frozen_string_literal: true

require "rails_helper"

RSpec.describe Term, type: :model do
  describe ".new" do
    it { expect(described_class).to respond_to(:new) }
  end

  describe ".create" do
    it { expect(described_class).to respond_to(:create) }
    it do
      action = -> { described_class.create(attributes_for(:term)) }
      behavior = -> { described_class.count }
      expect { action.call }.to change { behavior.call }.by(1)
    end
  end

  describe ".find" do
    let(:record) { create(:term) }
    it { expect(described_class).to respond_to(:find) }
    it { expect(described_class.find(record.id)).to eq(record) }
  end

  describe "#save" do
    subject { build(:term) }
    it { is_expected.to respond_to(:save) }
    it { expect { subject.save }.to change { described_class.count }.by(1) }
    it_behaves_like "shufflable"
  end

  describe "#update" do
    subject { create(:term) }
    it { is_expected.to respond_to(:update) }
    it { expect(subject.update(term: "World")).to be_truthy }
  end

  describe "#destroy" do
    let!(:record) { create(:term) }
    subject { record }
    it { is_expected.to respond_to(:destroy) }
    it { expect { subject.destroy }.to change { described_class.count }.by(-1) }
  end

  describe ".find_similarity" do
    it { expect(described_class).to respond_to :find_similarity }
    it do
      term = build :term
      expect { described_class.find_similarity term }.not_to raise_error
    end
    it "returns an array" do
      term = build :term
      expect(described_class.find_similarity term).to be_a Array
    end
  end

  describe ".find_random" do
    it { expect(described_class).to respond_to :find_random }
    it { expect { described_class.find_random }.not_to raise_error }
    it do
      create :term
      expect(described_class.find_random).to be_a described_class
    end
  end

  describe ".shuffle_up" do
    it { expect(described_class).to respond_to :shuffle_up }
    it { expect { described_class.shuffle_up(1) }.not_to raise_error }
    it { expect(described_class.shuffle_up(1)).to be_a ActiveRecord::Relation }
  end

  describe ".shuffle_down" do
    it { expect(described_class).to respond_to :shuffle_down }
    it { expect { described_class.shuffle_down(1) }.not_to raise_error }
    it { expect(described_class.shuffle_down(1)).to be_a ActiveRecord::Relation }
  end
end
