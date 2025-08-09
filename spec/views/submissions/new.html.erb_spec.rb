require 'rails_helper'

# TODO: add more tests for the various contexts
RSpec.describe 'submissions/new' do
  before do
    assign :submission,
           Submission.new(html:                '<a href="https://aaronparecki.com" class="h-card">@aaronpk</a>',
                          base_url:            nil,
                          save_html:           false,
                          render_html_in_page: false)
  end

  it 'renders new submission form' do
    render
    html = Nokogiri::HTML.parse(rendered)

    submission_form = html.css "form[action='#{submissions_path}'][method=post]"
    expect(submission_form).to be_present

    html_field = submission_form.css 'textarea#submission_html'
    expect(html_field).to be_present

    base_url_field = submission_form.css 'input#submission_base_url'
    expect(base_url_field).to be_present
  end
end
