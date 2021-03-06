require 'spec_helper'

feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    sign_up
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', name: 'Makers Academy')
    tag = Tag.create(name: 'Sport')
    bookmark.tags  << tag
    bookmark.save

    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

end
