feature 'Creating tags' do

	scenario 'Stores website links in bookmark' do
		visit '/links/new'
		fill_in :url, with: 'http://www.google.com'
		fill_in :name, with: 'Google'
    fill_in :tags, with: 'Sport'
		click_button 'Add link'

		link = Bookmark.first
    expect(link.tags.map(&:name)).to include('Sport')
    expect(page).to have_content('Sport')
		end

end
