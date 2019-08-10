require 'rails_helper'

describe RegistrationsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end

    it "renders the :new1 template" do
      get :new1
      expect(response).to render_template :new1
    end

    it "renders the :new2 template" do
      get :new2
      expect(response).to render_template :new2
    end

    it "renders the :new3 template" do
      get :new3
      expect(response).to render_template :new3
    end

    it "renders the :new4 template" do
      get :new4
      expect(response).to render_template :new4
    end

    it "renders the :new5 template" do
      get :new5
      expect(response).to render_template :new5
    end

    it "renders the :new6 template" do
      get :new6
      expect(response).to render_template :new6
    end
  end
end