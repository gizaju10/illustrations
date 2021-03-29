require 'rails_helper'

# RSpec.describe "Sessions", type: :system, js: true do
RSpec.describe "Sessions", type: :system do
  it 'ログイン画面が表示されること' do
    # visit '/sessions/new'
    visit '/users/sign_in/'
  end
end