class Root < Grape::API
  version :v1, using: :path
  format :json

  mount V1::PostApi
end