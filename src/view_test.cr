require "amethyst/all"

module MyModule
  class TimeLogger < Middleware::Base

    def call(request)
      t_req    = Time.now
      response = @app.call(request)
      t_res    = Time.now
      elapsed  = (t_res - t_req).to_f*1000
      string   = "%.4f ms" % elapsed
      response.body += "<hr>"+string
      response
    end
  end

  class TestController < Controller
    actions :index, :user, :hello, :redirect

    def index
      html "Hello world!<img src='/assets/amethyst.png'>"
    end

    view "hello", "#{__DIR__}/views"
    def hello
      @name = "Andrew"
      respond_to do |format|
        format.any  { render "hello" } 
        format.html { render "hello" }
      end
    end

    def user
      html "Hello from user #{request.path_parameters["id"]}"
    end

    def redirect
      respond_to do |format|
        format.html { redirect_to "user/45" }
      end
    end

  end

  class MyApp < Base::App

    settings.configure do |conf|
      conf.environment = "development"
      conf.static_dirs = ["/assets", "/css", "/js"]
    end

    routes.draw do
      get  "/user/:id", "test#user"
      get  "/", "test#index"
      all  "/hello", "test#hello"
      register TestController
    end

    use TimeLogger
  end
end

MyModule::MyApp.new.serve