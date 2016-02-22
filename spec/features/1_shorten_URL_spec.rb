# As a user
# So that I don't have to type long URLs
# I want to enter a long URL and get a shortened version back

feature 'Providing short URls' do
  scenario 'when URL entered in form' do
    visit '/links/new'
    fill_in 'url', with: 'https://www.google.co.uk/#q=i+need+a+url+shortener'
    click_button 'SHORTEN'

    expect(page).to have_selector('#short_url', text: 'http://localhost:1337/random')
  end
end
