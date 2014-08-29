require 'rails_helper'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    user = User.create(user_name: 'user', email: 'user@example.com', :password => 'password')
    fill_in 'User name', with: 'user'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    expect(page).to have_content 'Log In'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(user_name: 'user', email: 'user@example.com', :password => 'password')
    fill_in 'User name', with: 'user'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log In'
    expect(page).to have_content 'Email or password is invalid'
  end
end
