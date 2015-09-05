require_relative '../bot/main'

class PokeController < Nephos::Controller

  def root
    return {
      json: {
          links: {
            return_poke: "/pokes/return",
            return_poke_for: "/pokes/return/:time",
          }
        }
    }
  end

  private
  def new_bot
    b = Bot.new
    b.username = ENV["FACEBOOK_USERNAME"]
    b.password = ENV["FACEBOOK_PASSWORD"]
    b.start
    b
  end
  def self.bot_lambda

  end
  public

  def return
    @@b ||= new_bot
    n = @@b.poke
    return {
      json: {
        count: n,
      }
    }
  end

  def return_for
    @@b ||= new_bot
    # spawn new job
    params["time"].to_i.times do
      e = @@b.poke
      n = e[:nb]
      names = e[:names].join(', ')
      puts "pokeed #{n} times #{names}" if n > 0
      sleep 1
    end
    return {content: "terminated"}
  end

end
