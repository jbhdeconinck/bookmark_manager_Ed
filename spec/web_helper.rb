def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'jbhdeconinck@gmail.com'
  fill_in :password, with: 'abcd'
  click_button('Sign up')
end
