Trylogic::Application.routes.draw do
  # get "home/index"
  get "eval/:fla", controller: :home, action: :evaluate
  match "jq", to: "home#jq"
  root to: "home#jq"
end
