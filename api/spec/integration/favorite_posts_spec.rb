require 'swagger_helper'

describe 'Favorite_Posts API' do
  path '/favorite_posts' do
    post 'Create a favorite_post' do
      tags 'Favorites'
      security [ Bearer: [] ]
      response '200', 'OK' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
        consumes 'application/json', 'application/xml'
        parameter name: :post, in: :body, schema: {
          type: :object,
          properties: {
            post_id: { type: :integer },
          },
          required: [ 'post_id' ]
        }
      end
    end
  end
  path '/favorite_post/{id}' do
    delete 'Delete favorite_post by Id' do
      tags 'Favorites'
      security [ Bearer: [] ]
      response '204', 'Delete favorite_post by Id' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
end