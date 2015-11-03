feature 'bookmark manager' do 
	
	scenario do 'User sees list of links on homepage'
		visit '/'
		expect(page).to have_content('Homepage')
	end

end