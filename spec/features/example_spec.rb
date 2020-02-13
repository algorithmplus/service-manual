require "rails_helper"

feature "Example", type: :feature do
  scenario "does stuff" do
    visit "/"
    expect(page.body).to include("Hello")
  end
end
