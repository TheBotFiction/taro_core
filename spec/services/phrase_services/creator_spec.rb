# frozen_string_literal: true

require "rails_helper"

module PhraseServices
  RSpec.describe Creator do
    let(:term) { attributes_for(:phrase)[:term] }
    let(:data) { {term: term, spelling: "String"} }
    let(:recipient_uid) { attributes_for(:recipient)[:uid] }

    subject { described_class.new data, recipient_uid: recipient_uid }

    describe ".new" do
      it { expect(described_class).to respond_to :new }
      it { expect { described_class.new }.to raise_error ArgumentError }
      it { expect { described_class.new data }.to raise_error ArgumentError }
      it do
        expect {
          described_class.new recipient_uid: recipient_uid
        }.to raise_error ArgumentError
      end
      it do
        expect {
          described_class.new data, recipient_uid: recipient_uid
        }.not_to raise_error
      end
    end

    describe "#call" do
      it { is_expected.to respond_to :call }
      it { expect { subject.call }.not_to raise_error }
      it { expect { subject.call }.to change { Recipient.count }.by 1 }
      it { expect { subject.call }.to change { Phrase.count }.by 1 }
      context "when existed phrase" do
        before do
          recipient = create :recipient, uid: recipient_uid
          create :phrase, term: term, recipient: recipient
        end
        it { expect { subject.call }.not_to change { Phrase.count } }
      end
      context "when existed recipient" do
        before { create :recipient, uid: recipient_uid }
        it { expect { subject.call }.not_to change { Recipient.count } }
      end
    end

    describe "#phrase" do
      it { is_expected.to respond_to :phrase }
      it { is_expected.not_to respond_to :phrase= }
      it { expect(subject.phrase).to be_nil }
      it do
        subject.call
        expect(subject.phrase).not_to be_nil
      end
    end

    describe "#recipient" do
      it { is_expected.to respond_to :recipient }
      it { is_expected.not_to respond_to :recipient= }
      it { expect(subject.recipient).to be_nil }
      it do
        subject.call
        expect(subject.recipient).not_to be_nil
      end
    end
  end
end
