Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/movies", to: "movies#movies"
  get "/movies/:id", to: "movies#singleMovie"
  # get "/movies?limit=2", to: "movies#limitMovie"
  delete "/movies/:id", to: "movies#deleteMovie"
  get "/movies", to: "movies#getAllMovie"
  post "/movies/createMovie", to: "movies#createMovie"
  put  "/movies/:id", to: "movies#updateMovie"

  get "/todos", to: "todo#getAllTodo"
  post "/todos/createTodo", to: "todo#createTodo"
  delete "/todos/:id", to: "todo#deleteTodo"
  put  "/todos/:id", to: "todo#updateTodo"
  # Defines the root path route ("/")
  # root "articles#index"
end
