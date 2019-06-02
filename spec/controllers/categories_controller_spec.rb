require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:category) { create(:category) }

  describe 'GET #index' do
    let(:categories) { create_list(:category, 3) }

    before { get :index }

    it 'populated an array all questions' do
      expect(assigns(:categories)).to match_array(categories)
    end

    it 'renders index view ' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: category } }

    it 'render show view ' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'render new view ' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: category } }

    it 'render edit view ' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      subject do
        post :create, params: { category: attributes_for(:category) }
      end

      it_behaves_like 'change count object', Category, 1

      it 'redirect to show view' do
        subject
        expect(response).to redirect_to assigns(:category)
      end
    end

    context 'with invalid attributes' do
      subject do
        post :create, params: { category: attributes_for(:category, :invalid) }
      end

      it_behaves_like 'not change count object', Category

      it 're-render new view' do
        subject
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assigns the requested category to @category' do
        patch :update, params: { id: category, category: attributes_for(:category) }
        expect(assigns(:category)).to eq category
      end

      it 'changes category attributes' do
        patch :update, params: { id: category, category: { name: 'My name.', description: 'new description' } }
        category.reload

        expect(category.name).to eq 'My name.'
        expect(category.description).to eq 'new description'
      end

      it 'redirect to updated category' do
        patch :update, params: { id: category, category: attributes_for(:category) }
        expect(response).to redirect_to categories_path
      end
    end

    context 'with invalid attributes' do
      let(:category) { create(:category, name: 'My name.', description: 'MyDescription' )}
      before { patch :update, params: { id: category, category: attributes_for(:category, :invalid) } }

      it 'not change question' do
        category.reload

        expect(category.name).to eq 'My name.'
        expect(category.description).to eq 'MyDescription'
      end
      it 're-render edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:category) { create(:category) }
    subject { delete :destroy, params: { id: category } }

    context 'login by owner user' do
      it 'delete question' do
        expect { subject }.to change(Category, :count).by(-1)
      end

      it 'redirect to index' do
        subject
        expect(response).to redirect_to categories_path
      end
    end
  end
end
