feature 'Creating multiple tags' do

	scenario 'assign multiple tags to a single link' do
		sign_up
		visit '/links/new'
		fill_in :url, with: 'http://www.google.com'
		fill_in :name, with: 'Google'
    fill_in :tags, with: 'Sport News'
		click_button 'Add link'

		link = Bookmark.first
    expect(link.tags.map(&:name)).to include('Sport', 'News')
    expect(page).to have_content('Sport')
    expect(page).to have_content('News')
		end

end
