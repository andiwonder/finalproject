             users GET    /users(.:format)              users#index
                   POST   /users(.:format)              users#create
          new_user GET    /users/new(.:format)          users#new
         edit_user GET    /users/:id/edit(.:format)     users#edit
              user GET    /users/:id(.:format)          users#show
                   PATCH  /users/:id(.:format)          users#update
                   PUT    /users/:id(.:format)          users#update
                   DELETE /users/:id(.:format)          users#destroy



                                 root GET    /                             welcome#index
                   GET    /                             welcome#index
      sessions_new GET    /sessions/new(.:format)       sessions#new
          sessions POST   /sessions(.:format)           sessions#create
                   DELETE /sessions(.:format)           sessions#destroy