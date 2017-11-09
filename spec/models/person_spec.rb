require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) do
    Person.new(first_name: 'Yason', last_name: 'Mogutin')
  end

  it 'is_valid' do
    expect(person).to be_valid
  end 

  it 'is invalid without a first_name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end
end
