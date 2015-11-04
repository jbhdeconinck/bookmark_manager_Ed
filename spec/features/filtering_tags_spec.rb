feature 'Filtering tags' do

	scenario 'filter tags' do
		visit '/links/new'
		fill_in :url, with: 'http://www.google.com'
		fill_in :name, with: 'Google'
    fill_in :tags, with: 'Sport'
		click_button 'Add link'

    visit '/links/new'
    fill_in :url, with: 'http://www.facebook.com'
    fill_in :name, with: 'facebook'
    fill_in :tags, with: 'bubbles'
    click_button 'Add link'

    visit '/links/new'
    fill_in :url, with: 'http://www.bbc.com'
    fill_in :name, with: 'BBC'
    fill_in :tags, with: 'bubbles'
    click_button 'Add link'

    visit '/tags/bubbles'

    expect(page).to have_content('bubbles')
    expect(page).to have_content('bbc.com')
    expect(page).to have_content('facebook.com')
    expect(page).to_not have_content('google.com')
		end

end
