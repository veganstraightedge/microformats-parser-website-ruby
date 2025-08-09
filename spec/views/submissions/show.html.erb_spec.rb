require 'rails_helper'

RSpec.describe 'submissions/show' do
  let :submission do
    Submission.create! html:                'MyText',
                       base_url:            'MyText',
                       save_html:           false,
                       render_html_in_page: false
  end

  before do
    assign :submission, submission
  end

  it 'renders attributes in <p>' do
    render
    doc = Nokogiri::HTML rendered

    form = doc.css("form[action='#{submission_path(submission.id)}'][method='post']")
    expect(form).to be_present

    html_textarea = form.css('textarea[name="submission[html]"]')
    expect(html_textarea).to be_present

    base_url_input = form.css('input[name="submission[base_url]"][value="MyText"]')
    expect(base_url_input).to be_present

    json_textarea = form.css('textarea[name="submission[json]"]')
    expect(json_textarea).to be_present
  end
end
