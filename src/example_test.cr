require "amethyst"

class WordController < Base::Controller
  actions :hello

  view "hello", "#{__DIR__}/views"
  def hello
    @name = "World"
    respond_to do |format|
      puts request.cookies.to_s
      format.html { render "hello" }
    end
  end

  def check_name
    if params[:name] == "amethyst"
      true
    else
      html "Name should be <a href='/?name=amethyst'>Amethyst</a>"
      false
    end
  end

  before_action "check_name"
end

class HelloWorldApp < Base::App
  routes.draw do
    all "/",      "word#hello" 
    get "/hello", "word#hello" 
    register WordController
  end
end

app = HelloWorldApp.new
app.serve