require "open-uri"
require "json"

class ForexController < ApplicationController

  def currency_pairs

    exchange_rate_url = "https://api.exchangerate.host/symbols"

    raw_rate_data = URI.open(exchange_rate_url).read
    parsed_rate_data = JSON.parse(raw_rate_data)
    @rate_array = parsed_rate_data.fetch("symbols")
    @code_array = Array.new

    @rate_array.each do |currency|
      @code_array.push(currency.fetch(0))
    end

    render(:template=>"forex_templates/forex_main.html.erb")
  end

  def display_second
    @symbol = params.fetch(:first_symbol)

    exchange_rate_url = "https://api.exchangerate.host/symbols"

    raw_rate_data = URI.open(exchange_rate_url).read
    parsed_rate_data = JSON.parse(raw_rate_data)
    @rate_array = parsed_rate_data.fetch("symbols")
    @code_array = Array.new

    @rate_array.each do |currency|
      @code_array.push(currency.fetch(0))
    end
    render(:template=>"forex_templates/forex_second.html.erb")
  end

  def conversion
    @first_symbol = params.fetch(:first_symbol)
    @sec_symbol = params.fetch(:sec_symbol)

    conversion_url = "https://api.exchangerate.host/convert?from=#{@first_symbol}&to=#{@sec_symbol}"
    
    raw_conversion_data = URI.open(conversion_url).read
    parsed_conversion_data = JSON.parse(raw_conversion_data)
    info_hash = parsed_conversion_data.fetch("info")
    @conversion = info_hash.fetch("rate")
    render(:template=>"forex_templates/conversion.html.erb")
  end
end
