require 'uri'
class MessageTranslator

  attr_reader :message, :dialect

  BASE_URL = 'http://www.degraeve.com/cgi-bin/babel.cgi'.freeze

  def initialize(message, dialect)
    @message = message
    @dialect = dialect
  end

  def translate
    parse_response(document)
  end

  private

  def parse_response(doc)
    gather_result(doc).delete("\n").strip
  end

  def gather_result(doc)
    doc.xpath('//table//blockquote//p').first&.text.to_s
  end

  def full_url
    "#{BASE_URL}?d=#{dialect}&w=#{encoded_message}"
  end

  def encoded_message
    URI.encode_www_form_component(message)
  end

  def document
    @doc ||= Nokogiri::HTML(external_content)
  end

  def external_content
    open(full_url)
  end
end
