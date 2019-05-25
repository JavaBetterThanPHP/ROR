require 'swagger_helper'

describe 'Posts API' do
  path '/api/v1/posts' do
    get 'Get all posts' do
      tags 'Posts'
      consumes 'application/json'
      response '200', 'Ok' do
        'ok'
      end
    end
  end
end