require 'rails_helper'

describe ItemsController do
  let(:user) {create(:user)}

  describe 'GET #new' do
    context 'log in' do
      before do
        login user
        get :new
      end
      
      it "@categoriesに適切な値が代入されている" do
        categories = create_list(:category, 20)
        expect(assigns(:categories)).to match(categories)
      end

      it "@itemを新規作成する" do
        expect(assigns(:item)).to be_a_new(Item)
      end

      it "new.html.hamlに遷移する" do
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      before do
        get :new
      end

      it "ログインページにリダイレクトする" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
end