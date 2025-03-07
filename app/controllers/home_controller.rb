class HomeController < ApplicationController
  def module3
    @users = [{ name: "John", age: 25 }, { name: "Jane", age: 22 }]
  end
end
