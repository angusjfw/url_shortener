module FormHelpers
  def create_link(link)
    visit '/links/new'
    fill_in 'url', with: link
    click_button 'SHORTEN'
  end
end
