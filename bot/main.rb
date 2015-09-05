require 'capybara/poltergeist'
require 'nokogiri'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
Capybara.default_driver = :poltergeist

class Bot


  def initialize
    @a = Capybara.current_session
  end

  attr_writer :username, :password
  attr_reader :a
  def start
    @a.visit "https://www.facebook.com/"
    @a.document.find_field(:email).set @username
    @a.document.find_field(:pass).set @password
    @a.document.click_button("Log In")
    puts "Logged in"
  end

  # if name is a String, try to poke him
  # else, returns every pokes
  def poke(name=nil)
    @a.visit "https://www.facebook.com/pokes"
    return_pokes = @a.document.find_css("._4-u2._xct._4-u8").first
    return_persons = return_pokes.find_css("._6a._42us").map{|e|e.find_css("div").first}.map(&:all_text)
    return_links = @a.document.find_css("._4-u2._xct._4-u8").first.find_css("._51sy")
    return_links.each{|btn| btn.click }
    return {
      names: return_persons,
      nb: return_links.size,
    }
  end

end
