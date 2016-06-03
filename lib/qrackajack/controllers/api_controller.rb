# This file was automatically generated for Expedited Addons by APIMATIC v2.0 ( https://apimatic.io ) on 06/03/2016

module Qrackajack
  class APIController < BaseController
    @@instance = APIController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # TODO: type endpoint description here
    # @param [String] content Required parameter: The content to encode into the QR code (e.g. a URL or a phone number)
    # @param [Integer] width Required parameter: The width of the QR code (in px)
    # @param [Integer] height Required parameter: The height of the QR code (in px)
    # @param [String] fg_color Required parameter: The QR code foreground color (you should always use a dark color for this)
    # @param [String] bg_color Required parameter: The QR code background color (you should always use a light color for this)
    # @return Mixed response from the API call
    def lookup(content, 
               width, 
               height, 
               fg_color, 
               bg_color)

      # Validate required parameters
      if content == nil
        raise ArgumentError.new "Required parameter 'content' cannot be nil."
      elsif width == nil
        raise ArgumentError.new "Required parameter 'width' cannot be nil."
      elsif height == nil
        raise ArgumentError.new "Required parameter 'height' cannot be nil."
      elsif fg_color == nil
        raise ArgumentError.new "Required parameter 'fg_color' cannot be nil."
      elsif bg_color == nil
        raise ArgumentError.new "Required parameter 'bg_color' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'content' => content,
        'width' => width,
        'height' => height,
        'fg_color' => fg_color,
        'bg_color' => bg_color,
        'api_key' => Configuration.api_key
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json'
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 404
        return nil
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Return appropriate type
      _response.body.dup
    end
  end
end
