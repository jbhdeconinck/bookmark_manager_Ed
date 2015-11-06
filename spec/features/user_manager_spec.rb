feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: 'jbhdeconinck@gmail.com'
    fill_in :password, with: 'abcd'
    click_button('Sign up')

    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, jbhdeconinck@gmail.com')
    expect(User.first.email).to eq('jbhdeconinck@gmail.com')
  end
end
