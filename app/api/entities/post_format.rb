module Entities::V1
  class PostFormat < Grape::Entity
    expose :id
    expose :title
    expose :body
  end
end