Rails.application.routes.draw do

  get("/", :controller=>"application",:action=>"dashboards")
  get("/forex", :controller=>"forex",:action=>"currency_pairs")
  get("/forex/:first_symbol", :controller=>"forex",:action=>"display_second")
  get("/forex/:first_symbol/:sec_symbol", :controller=>"forex",:action=>"conversion")

end
