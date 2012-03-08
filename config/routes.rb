Trylogic::Application.routes.draw do
  get "home/index"
  get "eval", controller: :home, action: :evaluate
  root to: "home#index"
end
