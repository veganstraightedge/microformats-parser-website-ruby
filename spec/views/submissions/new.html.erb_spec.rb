require 'rails_helper'

RSpec.describe 'submissions/new' do
  let(:submission) do
    Submission.new(
      html:                '<div class="h-card">Test</div>',
      base_url:            'https://example.com',
      save_html:           false,
      render_html_in_page: false
    )
  end

  before do
    assign :submission, submission
    allow(view).to receive(:on_results_page?).and_return false
  end

  it 'renders the URL parsing form' do
    render
    doc = Nokogiri::HTML rendered

    form = doc.css("form[action='#{microformats_path}'][method='get']")
    expect(form).to be_present

    url_input = form.css('input#submission_url[type="url"]')
    expect(url_input).to be_present

    submit_button = form.css('input[type="submit"][value="Parse"]')
    expect(submit_button).to be_present
  end

  it 'renders the HTML snippet form' do
    render
    doc = Nokogiri::HTML rendered

    form = doc.css("form[action='#{submissions_path}'][method='post']")
    expect(form).to be_present

    html_textarea = form.css('textarea#submission_html')
    expect(html_textarea).to be_present

    base_url_input = form.css('input#submission_base_url[type="url"]')
    expect(base_url_input).to be_present
  end

  it 'renders form controls for HTML snippet form' do
    render
    doc = Nokogiri::HTML rendered

    save_html_checkbox = doc.css('input#submission_save_html[type="checkbox"]')
    expect(save_html_checkbox).to be_present

    render_html_checkbox = doc.css('input#submission_render_html_in_page[type="checkbox"]')
    expect(render_html_checkbox).to be_present

    submit_button = doc.css('input[type="submit"][value="Parse"]')
    expect(submit_button).to be_present
  end

  it 'renders labels for form fields' do
    render
    doc = Nokogiri::HTML rendered

    expect(doc.css('label').text).to include 'Enter a URL'
    expect(doc.css('label').text).to include 'HTML'
    expect(doc.css('label').text).to include 'Base URL'
    expect(doc.css('label[for="submission_save_html"]').text).to include 'Save HTML?'
    expect(doc.css('label[for="submission_render_html_in_page"]').text).to include 'Render HTML in Page?'
  end

  it 'displays the section heading' do
    render
    doc = Nokogiri::HTML rendered

    heading = doc.css('h2')
    expect(heading.text).to include 'OR parse just a snippet of HTML'
  end

  it 'does not render JSON field on new form' do
    render
    doc = Nokogiri::HTML rendered

    json_textarea = doc.css('textarea#submission_json')
    expect(json_textarea).to be_empty
  end

  it 'renders form fields as enabled (not disabled)' do
    render
    doc = Nokogiri::HTML rendered

    html_textarea = doc.css('textarea#submission_html[disabled]')
    expect(html_textarea).to be_empty

    base_url_input = doc.css('input#submission_base_url[disabled]')
    expect(base_url_input).to be_empty
  end
end
