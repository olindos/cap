require 'rails_helper'

RSpec.describe PhoneNumbersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PhoneNumber. As you add validations to PhoneNumber, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { number: "MyString", person_id: 1}
  }

  let(:invalid_attributes) {
    { number: nil, person_id: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhoneNumbersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      phone_number = PhoneNumber.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      phone_number = PhoneNumber.create! valid_attributes
      get :show, params: {id: phone_number.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      phone_number = PhoneNumber.create! valid_attributes
      get :edit, params: {id: phone_number.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:yasin) { Person.create(first_name: 'Yasin', last_name: 'Mogutin') }
      let(:valid_attributes) { {number: '555-1234', person_id: yasin.id} }
      
      it "creates a new PhoneNumber" do
        expect {
          post :create, params: {phone_number: valid_attributes}, session: valid_session
        }.to change(PhoneNumber, :count).by(1)
      end

      it "redirects to the phone number's person" do
        yasin = Person.create(first_name: 'Yasin', last_name: 'Mogutin')
        valid_attributes = {number: '555-8898', person_id: yasin.id}
        post :create, params: {phone_number: valid_attributes}, session: valid_session
        expect(response).to redirect_to(yasin)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {phone_number: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:jane) { Person.create(first_name: 'Jane', last_name: 'Dou')}
      let(:valid_attributes) {
        { number: '555-7896', person_id: jane.id}
      }
      let(:new_attributes) {
        { number: 'MyNewString', person_id: jane.id }
      }

      it "updates the requested phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, params: {id: phone_number.to_param, phone_number: new_attributes}, session: valid_session
        phone_number.reload
        expect(phone_number.number).to eq('MyNewString')
        expect(phone_number.person_id).to eq(2)
      end

      it "redirects to the phone_number" do
        jane = Person.create(first_name: 'Jane', last_name: 'Dou')
        valid_attributes = { number: '555-7896', person_id: jane.id}
        phone_number = PhoneNumber.create! valid_attributes
        put :update, params: {id: phone_number.to_param, phone_number: valid_attributes}, session: valid_session
        expect(response).to redirect_to(jane)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, params: {id: phone_number.to_param, phone_number: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      expect {
        delete :destroy, params: {id: phone_number.to_param}, session: valid_session
      }.to change(PhoneNumber, :count).by(-1)
    end

    it "redirects to the phone_numbers list" do
      phone_number = PhoneNumber.create! valid_attributes
      delete :destroy, params: {id: phone_number.to_param}, session: valid_session
      expect(response).to redirect_to(phone_numbers_url)
    end
  end

end
