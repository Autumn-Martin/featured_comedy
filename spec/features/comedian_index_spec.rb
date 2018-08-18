RSpec.describe 'Comedian index page' do
  before(:each) do
    @comic_1 = Comedian.create(name: 'Mitch Hedberg', age: 48)
    @comic_2 = Comedian.create(name: 'Mitchy Hedberg', age: 42)
    @special_1 = @comic_1.specials.create(name: 'Christmas Special')
    @special_2 = @comic_2.specials.create(name: 'New Years Special')
  end

  context 'shows comedian details' do
    it 'should show basic comedian details' do
      visit '/comedians'

      expect(page).to have_content(@comic_1.name)
      expect(page).to have_content(@comic_2.name)

      expect(page).to have_content("Age: #{comic_1.age}")
      # expect(page).to have_content("Age: " + comic_1.age)
      expect(page).to have_content("Age: #{comic_2.age}")
    end
  end
  context 'shows comedian TV specials for each comic' do
    it 'should show all comedian TV specials' do
      visit '/comedians'

    within("#comic-#{comic_1.id}") do # go find css id 
      expect(page).to have_content(@comic_1.special_1.name)
      expect(page).to have_content("Special Count: #{comic_1.specials.count}")
    end
    within("#{comic_1.id}") do
      expect(page).to have_content(@comic_1.special_1.name)
      expect(page).to have_content("Special Count: #{comic_2.specials.count}") # activerecord method, so just fetches integer not array
    end
    end
  end
  context 'shows comedian average age' do
    it 'should show the average comedian age' do
      visit '/comedians'

    # expect(page).to have_content(Comedian.average_age)
    expect(page).to have_content("Average Age: #{Comedian.average_age}")
    end

    it 'should filter comedians by a given age' do
      visit '/comedians?age=42'

      expect(page).to_not have_content(@comic_1.name)
      expect(page).to have_content(@comic_2.name)
    end
  end
end
