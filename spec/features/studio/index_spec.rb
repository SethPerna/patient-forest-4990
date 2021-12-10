require 'rails_helper'
describe 'Studio index page' do
  it 'when I visit the studio index page I see each studios name and location' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    dc = Studio.create!(name: 'DC', location: 'New York City')
    marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    visit '/studios'
    expect(page).to have_content(universal.name)
    expect(page).to have_content(universal.location)
  end

  it 'undneath each studio I see the title of all of its movies' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    dc = Studio.create!(name: 'DC', location: 'New York City')
    marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    jurassic = universal.movies.create!(title: 'Jurrasic Park', creation_year: 1993, genre: 'Action/Adventure')
    batman = dc.movies.create!(title: 'Batman', creation_year: 2016, genre: 'Action/Adventure')
    superman = dc.movies.create!(title: 'Superman', creation_year: 2014, genre: 'Action/Adventure')
    visit '/studios'

    expect(page).to have_content(jurassic.title)
    expect(page).to have_content(batman.title)
    expect(page).to have_content(superman.title)
  end
end
