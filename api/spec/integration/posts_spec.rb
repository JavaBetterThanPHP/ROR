require 'swagger_helper'

describe 'Posts API' do
  path '/posts' do
    get 'Get all posts' do
      security [ Bearer: [] ]
      response '200', 'all posts retrieved' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
  path '/posts' do
    get 'Get all posts' do
      security [ Bearer: [] ]
      response '200', 'all posts retrieved' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
  path '/posts' do
    get 'Get all posts' do
      security [ Bearer: [] ]
      response '200', 'all posts retrieved' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
end