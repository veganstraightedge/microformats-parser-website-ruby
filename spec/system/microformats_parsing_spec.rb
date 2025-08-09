require 'rails_helper'

RSpec.describe 'Microformats parsing' do
  it 'parses microformats from a URL' do
    visit '/'

    within 'form[action="/microformats"]' do
      fill_in 'url', with: 'https://aaronparecki.com'
      click_button 'Parse'
    end

    expect(page).to have_content 'package'
    expect(page).to have_content 'microformats-ruby'
    expect(page).to have_content 'version'
  end

  it 'parses microformats from HTML snippet without saving' do
    visit '/'

    within 'form[action="/submissions"]' do
      fill_in 'submission_html', with: '<div class="h-card">Test</div>'
      uncheck 'Save HTML?'
      click_button 'Parse'
    end

    expect(page).to have_content 'h-card'
  end

  it 'parses and saves microformats from HTML snippet' do
    visit '/'

    within 'form[action="/submissions"]' do
      fill_in 'submission_html', with: '<article class="h-entry">Test</article>'
      check 'Save HTML?'
      click_button 'Parse'
    end

    expect(page).to have_content 'Submission was successfully created'
  end

  it 'shows form validation when trying to save empty HTML' do
    visit '/'

    within 'form[action="/submissions"]' do
      fill_in 'submission_html', with: ''
      check 'Save HTML?'
      click_button 'Parse'
    end

    expect(page).to have_content 'items'
    expect(page).to have_content '[]'
  end

  it 'renders HTML in page when option is selected' do
    visit '/'

    html_snippet = '<div class="h-card"><span class="p-name">Test User</span></div>'

    within 'form[action="/submissions"]' do
      fill_in 'submission_html', with: html_snippet
      check 'Render HTML in Page?'
      click_button 'Parse'
    end

    expect(page).to have_css '.h-card'
    expect(page).to have_content 'Test User'
  end
end
