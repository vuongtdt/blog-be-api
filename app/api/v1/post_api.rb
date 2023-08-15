module V1
  class PostApi < Grape::API
    resource :posts do
      get do
        @posts = Post.all
        present @posts, with Entities::V1::PostFormat
      end

      params do
        require :title, type: String
        require :body, type: String
      end

      post do
        @post = Posts.new(title: params[:title], body: params[:body])
        @post.save
        present @post, with Entities::V1::PostFormat
      end

      route_param :id do
        before do
          @post = Posts.find(params[:id])
        end

        get do
          @post
          present @post, with Entities::V1::PostFormat
        end

        params do
          requires :title, type: String
          requires :body, type: String
        end

        patch do
          @post.update(params)
          present @post, with Entities::V1::PostFormat
        end

        delete do
          @post.destroy
        end
      end
    end
  end
end