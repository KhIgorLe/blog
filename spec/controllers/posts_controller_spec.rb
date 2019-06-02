require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:category) { create(:category) }

  describe 'GET #show' do
    let(:post) { create(:post) }

    before { get :show, params: { id: post } }

    it 'render show view ' do
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      subject do
        post :create, params: { category_id: category, post: attributes_for(:post), format: :js }
      end

      it_behaves_like 'change count object', Post, 1

      it 'renders create template ' do
        subject
        expect(response).to render_template :create
      end
    end

    context 'with invalid attributes' do
      subject do
        post :create, params: { category_id: category, post: attributes_for(:post, :invalid), format: :js }
      end

      it_behaves_like 'not change count object', Post

      it 're-render new view' do
        subject
        expect(response).to render_template :create
      end
    end
  end

  describe 'PATH #update' do
    let(:post) { create(:post, category: category) }

    context 'with valid attributes' do
      subject { patch :update, params: { id: post, post: { name: 'New name.', content: 'New content'} }, format: :js }

      it 'changes post attributes' do
        subject
        post.reload

        expect(post.name).to eq 'New name.'
        expect(post.content).to eq 'New content'
      end

      it 'renders update view' do
        subject

        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      subject { patch :update, params: { id: post, post: attributes_for(:post, :invalid) }, format: :js }

      it 'not change post attributes' do
        expect do
          subject
        end.to_not change(post, :name)
      end

      it 'renders update view' do
        subject

        expect(response).to render_template :update
      end
    end

  end

  describe 'DELETE #destroy' do
    let!(:post) { create(:post, category: category) }

    subject do
      delete :destroy, params: { id: post, format: :js }
    end

    it 'delete post' do
      expect { subject }.to change(Post, :count).by(-1)
    end
  end
end
