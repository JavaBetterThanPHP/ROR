require 'swagger_helper'

describe 'Bookmark_Posts API' do
  path '/bookmark_posts' do
    post 'Create a bookmark_post' do
      tags 'Bookmarks'
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
  path '/bookmark_posts/{id}' do
    delete 'Delete bookmark_posts by Id' do
      tags 'Bookmarks'
      security [ Bearer: [] ]
      response '204', 'Delete bookmark_posts by Id' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
end