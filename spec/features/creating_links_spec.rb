feature 'Creates links' do

	scenario 'Stores website links in bookmark' do
		sign_up
		visit '/links/new'
		fill_in :url, with: 'http://www.google.com'
		fill_in :name, with: 'Google'
		fill_in :tags, with: 'Sport'
		click_button 'Add link'

		expect(current_path).to eq '/links'

		within 'ul#links' do
	    expect(page).to have_content('Google')
		end

	end
end
