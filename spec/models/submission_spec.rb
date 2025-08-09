require 'rails_helper'

RSpec.describe Submission do
  it 'can be created with valid attributes' do
    submission = described_class.new(
      html:                '<div class="h-card">Test</div>',
      base_url:            'https://example.com',
      save_html:           true,
      render_html_in_page: true
    )
    expect(submission).to be_valid
  end

  it 'belongs to ActiveRecord' do
    expect(described_class.superclass).to eq(ApplicationRecord)
  end
end
