require "rails_helper"

RSpec.describe M::Term, type: :model do
  describe ".new" do
    it { expect(described_class).to respond_to(:new) }
  end

  describe ".create" do
    it { expect(described_class).to respond_to(:create) }
    it do
      action = -> { described_class.create(attributes_for(:m_term)) }
      behavior = -> { described_class.count }
      expect { action.call }.to change { behavior.call }.by(1)
    end
  end

  describe ".find" do
    let(:record) { create(:m_term) }
    it { expect(described_class).to respond_to(:find) }
    it { expect(described_class.find(record.id)).to eq(record) }
  end

  describe "#save" do
    subject { build(:m_term) }
    it { is_expected.to respond_to(:save) }
    it { expect { subject.save }.to change { described_class.count }.by(1) }
    it "attribute shuffling" do
      expect(subject.shuffling).to be_falsy
      subject.save
      expect(subject.shuffling).to be_truthy
    end
  end

  describe "#update" do
    subject { create(:m_term) }
    it { is_expected.to respond_to(:update) }
    it { expect(subject.update(term: "World")).to be_truthy }
  end

  describe "#destroy" do
    let!(:record) { create(:m_term) }
    subject { record }
    it { is_expected.to respond_to(:destroy) }
    it { expect { subject.destroy }.to change { described_class.count }.by(-1) }
  end
end
