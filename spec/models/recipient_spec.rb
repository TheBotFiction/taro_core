# frozen_string_literal: true

require "rails_helper"

RSpec.describe Recipient, type: :model do
  context "associations" do
    # it { should have_many(:attendances) }
  end

  describe ".new" do
    it { expect(described_class).to respond_to(:new) }
  end

  describe ".create" do
    it { expect(described_class).to respond_to(:create) }
    it do
      action = -> { described_class.create(attributes_for(:recipient)) }
      behavior = -> { described_class.count }
      expect { action.call }.to change { behavior.call }.by(1)
    end
  end

  describe ".find" do
    let(:record) { create(:recipient) }
    it { expect(described_class).to respond_to(:find) }
    it { expect(described_class.find(record.id)).to eq(record) }
  end

  describe "#save" do
    subject { build(:recipient) }
    it { is_expected.to respond_to(:save) }
    it { expect { subject.save }.to change { described_class.count }.by(1) }
  end

  describe "#update" do
    subject { create(:recipient) }
    it { is_expected.to respond_to(:update) }
    it { expect(subject.update(first_name: Faker::Name.first_name)).to be_truthy }
  end

  describe "#destroy" do
    let!(:record) { create(:recipient) }
    subject { record }
    it { is_expected.to respond_to(:destroy) }
    it { expect { subject.destroy }.to change { described_class.count }.by(-1) }
  end

  describe "#avatar" do
    subject { build(:recipient) }

    it do
      is_expected.to respond_to(:avatar)
      expect(subject.avatar).to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end
end
