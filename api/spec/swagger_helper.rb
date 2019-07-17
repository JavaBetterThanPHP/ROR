require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.to_s + '/swagger'

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:to_swagger' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      host: "localhost:3000",
      basePath: "/api/v1",
      securityDefinitions:{
        Bearer:{
          type: 'apiKey',
          name: 'Authorization',
          in: 'header'
        }
      },
      paths: {},
      definitions: {
        User: {
          type: "object",
          properties: {
            id: {
              type: "integer"
            },
            birthdate: {
              type: "string",
              format: "date-time"
            },
            description: {
              type: "string"
            },
            profilePictureUrl: {
              type: "string"
            },
            inscriptionDate: {
              type: "string",
              format: "date-time"
            },
            firstname: {
              type: "string"
            },
            lastname: {
              type: "string"
            },
            created_at: {
              type: "string",
              format: "date-time"
            },
            updated_at: {
              type: "string",
              format: "date-time"
            },
            password_digest: {
              type: "string"
            },
            email: {
              type: "string"
            }
          },
          xml: {
            name: "User"
          }
        },
        Post: {
          type: "object",
          properties: {
            id: {
              type: "integer"
            },
            title: {
              type: "string"
            },
            description: {
              type: "string"
            },
            date: {
              type: "string",
              format: "date-time"
            },
            timeToRead: {
              type: "integer"
            },
            mainImage: {
              type: "string"
            },
            score: {
              type: "integer"
            },
            content: {
              type: "string"
            },
            created_at: {
              type: "string",
              format: "date-time"
            },
            updated_at: {
              type: "string",
              format: "date-time"
            },
            user: {
              '$ref': "#/definitions/User"
            },
            type: {
              '$ref': "#/definitions/Type"
            }
          },
          xml: {
            name: "Post"
          }
        },
        Type: {
          type: "object",
          properties: {
            id: {
              type: "integer"
            },
            description: {
              type: "string"
            },
            created_at: {
              type: "string",
              format: "date-time"
            },
            updated_at: {
              type: "string",
              format: "date-time"
            }
          },
          xml: {
            name: "Type"
          }
        },
        Tag: {
          type: "object",
          properties: {
            id: {
              type: "integer",
              format: "int64"
            },
            name: {
              type: "string",
              example: "doggie"
            },
            created_at: {
              type: "string",
              format: "date-time"
            },
            updated_at: {
              type: "string",
              format: "date-time"
            }
          },
          xml: {
            name: "Tag"
          }
        }
      }
    }
  }
end
