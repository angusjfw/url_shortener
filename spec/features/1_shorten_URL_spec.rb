# As a user
# So that I don't have to type long URLs
# I want to enter a long URL and get a shortened version back

feature 'Providing short URls' do
  scenario 'when a URL is entered in the form' do
    allow(SecureRandom).to receive(:urlsafe_base64).and_return('random')
    visit '/links/new'
    fill_in 'url', with: 'https://www.google.co.uk/#q=i+need+a+url+shortener'
    click_button 'SHORTEN'

    expect(page.current_path).to include('/links/random')
    expect(page).to have_selector('#short-url', text: 'http://localhost:9292/random')
  end

  scenario 'when a different URL is entered in the form' do
    allow(SecureRandom).to receive(:urlsafe_base64).and_return('different')
    visit '/links/new'
    fill_in 'url', with: 'https://www.google.co.uk/#q=this+is+different'
    click_button 'SHORTEN'

    expect(page.current_path).to include('/links/different')
    expect(page).to have_selector('#short-url', text: 'http://localhost:9292/different')
  end
end
