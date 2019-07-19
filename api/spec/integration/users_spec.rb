require 'swagger_helper'

describe 'Users API' do

  path '/users' do
    get 'Get all users' do
      tags 'Users'
      security [ Bearer: [] ]
      response '200', 'all users retrieved' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
  path '/users/{id}' do
    get 'Get user by Id' do
      tags 'Users'
      security [ Bearer: [] ]
      response '200', 'Show User by Id' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
  path '/users' do
    post 'Create an user' do
      tags 'Users'
      security [ Bearer: [] ]
      response '200', 'OK' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
        consumes 'application/json', 'application/xml'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password_digest: { type: :string },
          },
          required: [ 'email', 'password_digest' ]
        }
      end
    end
  end
  path '/users/{id}' do
    delete 'Delete user by Id' do
      tags 'Users'
      security [ Bearer: [] ]
      response '204', 'Delete User by Id' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
      end
    end
  end
  path '/users/{id}' do
    put 'Update User by Id' do
      tags 'Users'
      security [ Bearer: [] ]
      response '200', 'OK' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
        consumes 'application/json', 'application/xml'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            birthdate: { type: :string },
            description: { type: :string },
            profilePictureUrl: { type: :string },
            inscriptionDate: { type: :string },
            firstname: { type: :string },
            lastname: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string },
            email: { type: :string },
            password_digest: { type: :string },
          },
          required: [ 'birthdate', 'description', 'profilePictureUrl', 'inscriptionDate', 'firstname', 'lastname', 'created_at', 'updated_at', 'email', 'password_digest' ]
        }
      end
    end
  end
  path '/users/sign_up' do
    post 'Register an user' do
      tags 'Users_Auth'
      security [ Bearer: [] ]
      response '200', 'OK' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
        consumes 'application/json', 'application/xml'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string },
            password_confirmation: { type: :string },
            birthdate: { type: :string },
            description: { type: :string },
            profilePictureUrl: { type: :string },
            inscriptionDate: { type: :string },
            firstname: { type: :string },
            lastname: { type: :string },
          },
          required: [ 'email', 'password', 'password_confirmation', 'birthdate', 'description', 'profilePictureUrl', 'inscriptionDate', 'firstname', 'lastname' ]
        }
      end
    end
  end
  path '/users/sign_in' do
    post 'Login an user' do
      tags 'Users_Auth'
      security [ Bearer: [] ]
      response '200', 'OK' do
        let(:Authorization){"Bearer#{''}"}
        run_test!
        consumes 'application/json', 'application/xml'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string },
          },
          required: [ 'email', 'password' ]
        }
      end
    end
  end
end