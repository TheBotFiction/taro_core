# frozen_string_literal: true

require "rails_helper"

RSpec.shared_examples "shufflable" do
  # let (:model) {create (described_class.to_s.underscore)}

  it { should have_db_column :shuffling }
  it { should have_db_index :shuffling }
  it "attribute shuffling" do
    expect(subject.shuffling).to be_falsy
    subject.save
    expect(subject.shuffling).to be_truthy
  end
end
