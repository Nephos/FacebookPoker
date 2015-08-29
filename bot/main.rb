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
  def start
    @a.visit "https://www.facebook.com/"
    @a.document.find_field(:email).set @username
    @a.document.find_field(:pass).set @password
    @a.document.click_button("Log In")
  end

  # if name is a String, try to poke him
  # else, returns every pokes
  def poke(name=nil)
    @a.visit "https://www.facebook.com/pokes"
    return_pokes = @a.document.find_css("a._42ft._4jy0._4jy3._4jy1.selected._51sy").select{|e| e.all_text == "Envoyer un poke en retour"}
    return_pokes.each{|btn| btn.click }
    return_pokes.size
  end

end
