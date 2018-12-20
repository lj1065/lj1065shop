module SearchHelper
  def fill_and_search(term)
    visit faq_path
    expect(page).to have_css("#search", visible: true)
    find("#search").click
    fill_in("term", with: term)
    find("#my-input-field").native.send_keys(:return)
    expect(page).to have_css("#search", visible: true)
  end
end
