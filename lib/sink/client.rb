# frozen_string_literal: true

module Sink
  class Client < BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 1

    # Client option
    # @return [String]
    attr_reader :user_token

    # Client option
    # @return [String]
    attr_reader :api_key_header

    # Client option
    # @return [String]
    attr_reader :api_key_query

    # Client option
    # @return [String]
    attr_reader :username

    # Client option
    # @return [String]
    attr_reader :client_id

    # Client option
    # @return [String]
    attr_reader :client_secret

    # Client option
    # @return [Boolean]
    attr_reader :some_boolean_arg

    # Client option
    # @return [Integer]
    attr_reader :some_integer_arg

    # Client option
    # @return [Float]
    attr_reader :some_number_arg

    # Client option
    # @return [Float]
    attr_reader :some_number_arg_required

    # Client option
    # @return [Float]
    attr_reader :some_number_arg_required_no_default

    # Client option
    # @return [Float]
    attr_reader :some_number_arg_required_no_default_no_env

    # Client option
    # @return [String]
    attr_reader :required_arg_no_env

    # Client option
    # @return [String]
    attr_reader :required_arg_no_env_with_default

    # Client option
    # @return [String]
    attr_reader :client_path_param

    # Client option
    # @return [String]
    attr_reader :camel_case_path

    # Client option
    # @return [String]
    attr_reader :client_query_param

    # Client option
    # @return [String]
    attr_reader :client_path_or_query_param

    # @return [Sink::Resources::Testing]
    attr_reader :testing

    # @return [Sink::Resources::ComplexQueries]
    attr_reader :complex_queries

    # @return [Sink::Resources::Casing]
    attr_reader :casing

    # @return [Sink::Resources::Tools]
    attr_reader :tools

    # @return [Sink::Resources::UndocumentedResource]
    attr_reader :undocumented_resource

    # @return [Sink::Resources::MethodConfig]
    attr_reader :method_config

    # @return [Sink::Resources::Streaming]
    attr_reader :streaming

    # @return [Sink::Resources::PaginationTests]
    attr_reader :pagination_tests

    # @return [Sink::Resources::Docstrings]
    attr_reader :docstrings

    # @return [Sink::Resources::InvalidSchemas]
    attr_reader :invalid_schemas

    # @return [Sink::Resources::ResourceRefs]
    attr_reader :resource_refs

    # @return [Sink::Resources::Cards]
    attr_reader :cards

    # @return [Sink::Resources::Files]
    attr_reader :files

    # @return [Sink::Resources::Resources]
    attr_reader :resources

    # @return [Sink::Resources::ConfigTools]
    attr_reader :config_tools

    # Stainless API company
    # @return [Sink::Resources::Company]
    attr_reader :company

    # @return [Sink::Resources::OpenAPIFormats]
    attr_reader :openapi_formats

    # @return [Sink::Resources::Parent]
    attr_reader :parent

    # @return [Sink::Resources::Envelopes]
    attr_reader :envelopes

    # @return [Sink::Resources::Types]
    attr_reader :types

    # @return [Sink::Resources::Clients]
    attr_reader :clients

    # @return [Sink::Resources::Names]
    attr_reader :names

    # Widget is love
    # Widget is life
    # @return [Sink::Resources::Widgets]
    attr_reader :widgets

    # @return [Sink::Resources::Responses]
    attr_reader :responses

    # @return [Sink::Resources::PathParams]
    attr_reader :path_params

    # @return [Sink::Resources::PositionalParams]
    attr_reader :positional_params

    # @return [Sink::Resources::EmptyBody]
    attr_reader :empty_body

    # @return [Sink::Resources::QueryParams]
    attr_reader :query_params

    # @return [Sink::Resources::BodyParams]
    attr_reader :body_params

    # @return [Sink::Resources::HeaderParams]
    attr_reader :header_params

    # @return [Sink::Resources::MixedParams]
    attr_reader :mixed_params

    # @return [Sink::Resources::MakeAmbiguousSchemasLooser]
    attr_reader :make_ambiguous_schemas_looser

    # @return [Sink::Resources::MakeAmbiguousSchemasExplicit]
    attr_reader :make_ambiguous_schemas_explicit

    # @return [Sink::Resources::DecoratorTests]
    attr_reader :decorator_tests

    # @return [Sink::Resources::Tests]
    attr_reader :tests

    # @return [Sink::Resources::DeeplyNested]
    attr_reader :deeply_nested

    # @return [Sink::Resources::Version1_30Names]
    attr_reader :version_1_30_names

    # @return [Sink::Resources::Recursion]
    attr_reader :recursion

    # @return [Sink::Resources::SharedQueryParams]
    attr_reader :shared_query_params

    # @return [Sink::Resources::ModelReferencedInParentAndChild]
    attr_reader :model_referenced_in_parent_and_child

    # Creates and returns a new client for interacting with the API.
    #
    # @param environment ["production", "sandbox", nil] Specifies the environment to use for the API.
    #
    #   Each environment maps to a different base URL:
    #
    #   - `production` corresponds to `https://demo.stainlessapi.com/`
    #   - `sandbox` corresponds to `https://demo-sanbox.stainlessapi.com/`
    # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
    # @param user_token [String, nil] The API Key for the SINK API, sent as a bearer token Defaults to
    #   `ENV["SINK_CUSTOM_API_KEY_ENV"]`
    # @param api_key_header [String, nil] The API Key for the SINK API, sent as an api key header Defaults to
    #   `ENV["SINK_CUSTOM_API_KEY_HEADER_ENV"]`
    # @param api_key_query [String, nil] The API Key for the SINK API, sent as an api key query Defaults to
    #   `ENV["SINK_CUSTOM_API_KEY_QUERY_ENV"]`
    # @param username [String, nil] Defaults to `ENV["SINK_USER"]`
    # @param client_id [String, nil] Defaults to `ENV["SINK_CLIENT_ID"]`
    # @param client_secret [String, nil] Defaults to `ENV["SINK_CLIENT_SECRET"]`
    # @param some_boolean_arg [Boolean, nil] Defaults to `ENV["SINK_SOME_BOOLEAN_ARG"]`
    # @param some_integer_arg [Integer, nil] Defaults to `ENV["SINK_SOME_INTEGER_ARG"]`
    # @param some_number_arg [Float, nil] Defaults to `ENV["SINK_SOME_NUMBER_ARG"]`
    # @param some_number_arg_required [Float, nil] Defaults to `ENV["SINK_SOME_NUMBER_ARG"]`
    # @param some_number_arg_required_no_default [Float, nil] Defaults to `ENV["SINK_SOME_NUMBER_ARG"]`
    # @param some_number_arg_required_no_default_no_env [Float, nil]
    # @param required_arg_no_env [String, nil]
    # @param required_arg_no_env_with_default [String, nil]
    # @param client_path_param [String, nil]
    # @param camel_case_path [String, nil]
    # @param client_query_param [String, nil]
    # @param client_path_or_query_param [String, nil]
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @return [Sink::Client]
    def initialize(
      environment: nil,
      base_url: nil,
      user_token: nil,
      api_key_header: nil,
      api_key_query: nil,
      username: nil,
      client_id: nil,
      client_secret: nil,
      some_boolean_arg: nil,
      some_integer_arg: nil,
      some_number_arg: nil,
      some_number_arg_required: nil,
      some_number_arg_required_no_default: nil,
      some_number_arg_required_no_default_no_env: nil,
      required_arg_no_env: nil,
      required_arg_no_env_with_default: nil,
      client_path_param: nil,
      camel_case_path: nil,
      client_query_param: nil,
      client_path_or_query_param: nil,
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: 60
    )
      environments = {"production" => "https://demo.stainlessapi.com/", "sandbox" => "https://demo-sanbox.stainlessapi.com/"}
      if environment && base_url
        raise ArgumentError, "both environment and base_url given, expected only one"
      elsif environment
        if !environments.key?(environment.to_s)
          raise ArgumentError, "environment must be one of #{environments.keys}, got #{environment}"
        end
        base_url = environments[environment.to_s]
      elsif !base_url
        base_url = "https://demo.stainlessapi.com/"
      end

      username_header = [username, ENV["SINK_USER"]].find { |v| !v.nil? }
      if username_header.nil?
        raise ArgumentError, "username is required"
      end
      client_secret_header = [client_secret, ENV["SINK_CLIENT_SECRET"], "hellosecret"].find { |v| !v.nil? }
      some_integer_arg_header = [some_integer_arg, ENV["SINK_SOME_INTEGER_ARG"], 123].find { |v| !v.nil? }
      headers = {
        "My-Api-Version" => "11",
        "X-Enable-Metrics" => "1",
        "X-Client-UserName" => username_header,
        "X-Client-Secret" => client_secret_header,
        "X-Integer" => some_integer_arg_header
      }

      idempotency_header = "Idempotency-Key"

      @user_token = [user_token, ENV["SINK_CUSTOM_API_KEY_ENV"]].find { |v| !v.nil? }
      @api_key_header = [api_key_header, ENV["SINK_CUSTOM_API_KEY_HEADER_ENV"]].find { |v| !v.nil? }
      @api_key_query = [api_key_query, ENV["SINK_CUSTOM_API_KEY_QUERY_ENV"]].find { |v| !v.nil? }
      @client_id = [client_id, ENV["SINK_CLIENT_ID"]].find { |v| !v.nil? }
      @some_boolean_arg = [some_boolean_arg, ENV["SINK_SOME_BOOLEAN_ARG"], true].find { |v| !v.nil? }
      @some_number_arg = [some_number_arg, ENV["SINK_SOME_NUMBER_ARG"], 1.2].find { |v| !v.nil? }
      @some_number_arg_required = [some_number_arg_required, ENV["SINK_SOME_NUMBER_ARG"], 1.2].find do |v|
        !v.nil?
      end
      @some_number_arg_required_no_default = [
        some_number_arg_required_no_default,
        ENV["SINK_SOME_NUMBER_ARG"]
      ].find do |v|
        !v.nil?
      end
      if @some_number_arg_required_no_default.nil?
        raise ArgumentError, "some_number_arg_required_no_default is required"
      end
      @some_number_arg_required_no_default_no_env = some_number_arg_required_no_default_no_env
      if @some_number_arg_required_no_default_no_env.nil?
        raise ArgumentError, "some_number_arg_required_no_default_no_env is required"
      end
      @required_arg_no_env = required_arg_no_env
      if @required_arg_no_env.nil?
        raise ArgumentError, "required_arg_no_env is required"
      end
      @required_arg_no_env_with_default = [required_arg_no_env_with_default, "hi!"].find { |v| !v.nil? }
      @client_query_param = client_query_param

      super(
        base_url: base_url,
        max_retries: max_retries,
        timeout: timeout,
        headers: headers,
        idempotency_header: idempotency_header
      )

      @testing = Sink::Resources::Testing.new(client: self)
      @complex_queries = Sink::Resources::ComplexQueries.new(client: self)
      @casing = Sink::Resources::Casing.new(client: self)
      @tools = Sink::Resources::Tools.new(client: self)
      @undocumented_resource = Sink::Resources::UndocumentedResource.new(client: self)
      @method_config = Sink::Resources::MethodConfig.new(client: self)
      @streaming = Sink::Resources::Streaming.new(client: self)
      @pagination_tests = Sink::Resources::PaginationTests.new(client: self)
      @docstrings = Sink::Resources::Docstrings.new(client: self)
      @invalid_schemas = Sink::Resources::InvalidSchemas.new(client: self)
      @resource_refs = Sink::Resources::ResourceRefs.new(client: self)
      @cards = Sink::Resources::Cards.new(client: self)
      @files = Sink::Resources::Files.new(client: self)
      @resources = Sink::Resources::Resources.new(client: self)
      @config_tools = Sink::Resources::ConfigTools.new(client: self)
      @company = Sink::Resources::Company.new(client: self)
      @openapi_formats = Sink::Resources::OpenAPIFormats.new(client: self)
      @parent = Sink::Resources::Parent.new(client: self)
      @envelopes = Sink::Resources::Envelopes.new(client: self)
      @types = Sink::Resources::Types.new(client: self)
      @clients = Sink::Resources::Clients.new(client: self)
      @names = Sink::Resources::Names.new(client: self)
      @widgets = Sink::Resources::Widgets.new(client: self)
      @responses = Sink::Resources::Responses.new(client: self)
      @path_params = Sink::Resources::PathParams.new(client: self)
      @positional_params = Sink::Resources::PositionalParams.new(client: self)
      @empty_body = Sink::Resources::EmptyBody.new(client: self)
      @query_params = Sink::Resources::QueryParams.new(client: self)
      @body_params = Sink::Resources::BodyParams.new(client: self)
      @header_params = Sink::Resources::HeaderParams.new(client: self)
      @mixed_params = Sink::Resources::MixedParams.new(client: self)
      @make_ambiguous_schemas_looser = Sink::Resources::MakeAmbiguousSchemasLooser.new(client: self)
      @make_ambiguous_schemas_explicit = Sink::Resources::MakeAmbiguousSchemasExplicit.new(client: self)
      @decorator_tests = Sink::Resources::DecoratorTests.new(client: self)
      @tests = Sink::Resources::Tests.new(client: self)
      @deeply_nested = Sink::Resources::DeeplyNested.new(client: self)
      @version_1_30_names = Sink::Resources::Version1_30Names.new(client: self)
      @recursion = Sink::Resources::Recursion.new(client: self)
      @shared_query_params = Sink::Resources::SharedQueryParams.new(client: self)
      @model_referenced_in_parent_and_child = Sink::Resources::ModelReferencedInParentAndChild.new(client: self)
    end

    # @!visibility private
    def make_status_error(message:, body:, response:)
      case response.code.to_i
      when 400
        Sink::HTTP::BadRequestError.new(message: message, response: response, body: body)
      when 401
        Sink::HTTP::AuthenticationError.new(message: message, response: response, body: body)
      when 403
        Sink::HTTP::PermissionDeniedError.new(message: message, response: response, body: body)
      when 404
        Sink::HTTP::NotFoundError.new(message: message, response: response, body: body)
      when 409
        Sink::HTTP::ConflictError.new(message: message, response: response, body: body)
      when 422
        Sink::HTTP::UnprocessableEntityError.new(message: message, response: response, body: body)
      when 429
        Sink::HTTP::RateLimitError.new(message: message, response: response, body: body)
      when 500..599
        Sink::HTTP::InternalServerError.new(message: message, response: response, body: body)
      else
        Sink::HTTP::APIStatusError.new(message: message, response: response, body: body)
      end
    end
  end
end
