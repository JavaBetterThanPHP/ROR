require 'swagger_helper'

describe 'Posts API' do
  path '/posts' do
    get 'Get all posts' do
      tags 'Posts'
      security [ Bearer: [] ]
      response '200', 'all posts retrieved' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
  path '/posts/{id}' do
    get 'Show post by Id' do
      tags 'Posts'
      security [ Bearer: [] ]
      response '200', 'Show Post by Id' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
  path '/posts' do
    post 'Create a post' do
      tags 'Posts'
      security [ Bearer: [] ]
      response '200', 'OK' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
        consumes 'application/json', 'application/xml'
        parameter name: :post, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            description: { type: :string },
            date: { type: :string },
            timeToRead: { type: :integer },
            mainImage: { type: :string },
            score: { type: :integer },
            content: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string },
            user_id: { type: :integer },
            type_id: { type: :integer },
          },
          required: [ 'title', 'description','date','timeToRead','mainImage','score','content','created_at','updated_at','user','type' ]
        }
      end
    end
  end
  path '/posts/{id}' do
    delete 'Delete post by Id' do
      tags 'Posts'
      security [ Bearer: [] ]
      response '204', 'Delete Post by Id' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
    path '/posts/{id}' do
    put 'Update a post by Id' do
      tags 'Posts'
      security [ Bearer: [] ]
      response '200', 'OK' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
        consumes 'application/json', 'application/xml'
        parameter name: :post, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            description: { type: :string },
            date: { type: :string },
            timeToRead: { type: :integer },
            mainImage: { type: :string },
            score: { type: :integer },
            content: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string },
            user_id: { type: :integer },
            type_id: { type: :integer },
          },
          required: [ 'title', 'description','date','timeToRead','mainImage','score','content','created_at','updated_at','user','type' ]
        }
      end
    end
  end

end