require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'is invalid without a last name' do
    person = Person.new(first_name: "Yas", last_name: nil)
    expect(person).not_to be_valid
  end
end
