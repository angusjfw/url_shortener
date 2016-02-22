#As a user
#So that I can visit my site
#I want my shortened URL to redirect to the longer original

# As a user
# So that I can keep using my shortened URL
# I want it to be persisted as a link to the longer version

feature 'Shortened urls redirect to the corresponding original' do
  long_link = 'https://www.google.co.uk/?q=i+need+a+url+shortener'
  code = 'soy_random'

  scenario 'entering a url and clicking the shortened redirect link' do
    create_link(long_link)
    click_link 'short-url'

    expect(page.current_url).to eq long_link
  end

  scenario 'visiting a shortened link direcly takes you to its original' do
    allow(SecureRandom).to receive(:urlsafe_base64).and_return(code)
    create_link(long_link)
    visit "/#{code}"

    expect(page.current_url).to eq long_link
  end
end
