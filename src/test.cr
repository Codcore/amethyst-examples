require "amethyst"

class TestController < Base::Controller
  actions :index, :user

  def index
    html "Hello world!<img src='/assets/amethyst.png'>  #{Base::App.settings.app_dir}"

    response.cookie "session", "Amethyst"
    response.cookie "name", "Andrew"
    p Dispatch::Router::INSTANCE.controllers
  end

  def user
    text "Here are users live :)"
  end
end

class TestApp < Base::App
  settings.configure do |conf|
    conf.environment = "production"
    conf.static_dirs = [ "/assets"]
  end

  routes.draw do
    get  "/user/:id", "test#user"
    post "/post/", "test#index"
    all  "/", "test#index"
    register TestController

    use Middleware::TimeLogger
  end
end


app = TestApp.new

app.serve
