# frozen_string_literal: true

require "sinatra/base"

class FakeYahooApis < Sinatra::Base
  get "/MAService/V1/parse" do
    xml_response(:ok, :morpheme)
  end

  post "/MAService/V1/parse" do
    xml_response(:ok, :morpheme)
  end

  get "/DAService/V1/parse" do
    xml_response(:ok, :dependency)
  end

  post "/DAService/V1/parse" do
    xml_response(:ok, :dependency)
  end

  private

  def xml_response(response_code, analyzer)
    fingerprint = Digest::SHA1.hexdigest params[:sentence]
    content_type "text/xml"
    status response_code
    File.open(
      File.expand_path(
        "../../fixtures/phrase-analyzer-#{analyzer}-#{fingerprint}.xml",
        __dir__
      ),
      "rb"
    ).read
  end
end
