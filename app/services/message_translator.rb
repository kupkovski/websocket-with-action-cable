require 'uri'
class MessageTranslator

  attr_reader :message, :language

  BASE_URL = 'http://www.degraeve.com/cgi-bin/babel.cgi'.freeze

  def initialize(message)
    @message = message
    @language = 'yoda'
  end

  def translate
    doc = generate_nokogiri_doc(full_url)
    gather_result(doc).delete("\n").strip
  end

  private

  def gather_result(doc)
    doc.xpath('//table//blockquote//p').first.text.to_s
  end

  def full_url
    "#{BASE_URL}?d=#{language}&w=#{encoded_message}"
  end

  def encoded_message
    URI.encode_www_form_component(message)
  end

  def generate_nokogiri_doc(url)
    @doc ||= Nokogiri::HTML(open(url))
  end
end