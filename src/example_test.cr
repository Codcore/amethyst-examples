require "amethyst"

class WordController < Base::Controller
  actions :hello

  view "hello", "#{__DIR__}/views", name
  def hello
    name = "World"
    respond_to do |format|
      puts request.cookies.to_s
      format.html { render "hello", name }
    end
  end
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