require 'grape-swagger'

class V1::Base < Grape::API
  mount V1::Requests

  add_swagger_documentation(
      api_version: "v1",
      hide_documentation_path: true,
      mount_path: "/api/v1/swagger_doc",
      hide_format: true
    )
end
