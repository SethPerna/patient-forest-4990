require 'rails_helper'
describe 'Movies show page' do
  it 'I see the movies title, creation year, and genre' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    dc = Studio.create!(name: 'DC', location: 'New York City')
    marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    jurassic = universal.movies.create!(title: 'Jurrasic Park', creation_year: 1993, genre: 'Action/Adventure')
    batman = dc.movies.create!(title: 'Batman', creation_year: 2016, genre: 'Action/Adventure')
    superman = dc.movies.create!(title: 'Superman', creation_year: 2014, genre: 'Action/Adventure')
    visit "/movies/#{jurassic.id}"

    expect(page).to have_content(jurassic.title)
    expect(page).to have_content(jurassic.creation_year)
    expect(page).to have_content(jurassic.genre)
  end

  it 'I see all its actors from youngest to oldest' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    dc = Studio.create!(name: 'DC', location: 'New York City')
    marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    jurassic = Movie.create!(title: 'Jurrasic Park', creation_year: 1993, genre: 'Action/Adventure', studio_id: universal.id)
    batman = Movie.create!(title: 'Batman', creation_year: 2016, genre: 'Action/Adventure', studio_id: dc.id)
    superman = Movie.create!(title: 'Superman', creation_year: 2014, genre: 'Action/Adventure', studio_id: dc.id)
    jeff = Actor.create!(name: 'Jeff Goldbluhm', age: 37)
    laura = Actor.create!(name: 'Laura Dern', age: 29)
    richard = Actor.create!(name: 'Richard Attenborough', age: 65)
    visit "/movies/#{jurassic.id}"

    expect(page).to have_content(jeff.name)
    expect(page).to have_content(laura.name)
    expect(page).to have_content(richard.name)
    expect(laura.name).to appear_before(jeff.name)
  end

  it 'I see the average age of actors in the movie' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    dc = Studio.create!(name: 'DC', location: 'New York City')
    marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    jurassic = Movie.create!(title: 'Jurrasic Park', creation_year: 1993, genre: 'Action/Adventure', studio_id: universal.id)
    batman = Movie.create!(title: 'Batman', creation_year: 2016, genre: 'Action/Adventure', studio_id: dc.id)
    superman = Movie.create!(title: 'Superman', creation_year: 2014, genre: 'Action/Adventure', studio_id: dc.id)
    jeff = Actor.create!(name: 'Jeff Goldbluhm', age: 43)
    laura = Actor.create!(name: 'Laura Dern', age: 45)
    richard = Actor.create!(name: 'Richard Attenborough', age: 44)
    visit "/movies/#{jurassic.id}"

    expect(page).to have_content(44)
  end

  it 'I see a form to add an actor' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    dc = Studio.create!(name: 'DC', location: 'New York City')
    marvel = Studio.create!(name: 'Marvel', location: 'Hollywood')
    jurassic = Movie.create!(title: 'Jurrasic Park', creation_year: 1993, genre: 'Action/Adventure', studio_id: universal.id)
    batman = Movie.create!(title: 'Batman', creation_year: 2016, genre: 'Action/Adventure', studio_id: dc.id)
    superman = Movie.create!(title: 'Superman', creation_year: 2014, genre: 'Action/Adventure', studio_id: dc.id)
    jeff = Actor.create!(name: 'Jeff Goldbluhm', age: 43)
    laura = Actor.create!(name: 'Laura Dern', age: 45)
    richard = Actor.create!(name: 'Richard Attenborough', age: 44)
    visit "/movies/#{jurassic.id}"

    expect(page).to have_button("Add Actor")
  end

  it 'when I clock the button I am taken back to the show page and I see that actor listed' do
    
  end
end
