require 'swagger_helper'

describe 'Posts API' do
  path '/users' do
    get 'Get all users' do
      security [ Bearer: [] ]
      response '200', 'all users retrieved' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
end