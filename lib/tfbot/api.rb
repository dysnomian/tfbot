class API < Grape::API
  version 'v1', using: :header, vendor: 'slack'
  format :json
  prefix :api

  helpers do
    def scope_user(username)
      @user = User.find_by_name(username)
    end

    def command_with_args(params)
      command, username, *args = params.fetch(:command, "").split
      {
        command: command,
        username: username,
        args: args.to_a.join(' ')
      }
    end
  end

  resource :descriptions do
    desc 'ping'
    post :ping do
      "PONG"
    end

    desc 'Set the description for a character.'
    post :set_description do
      command = command_with_args(params)
      if scope_user(command[:username])
        @user.description = command[:args]
        @user.save
        @user.readable_description
      end
    end

    desc 'Get the description for a character.'
    get :show do
      if scope_user(params[:user_name])
        @user.readable_description
      end
    end
  end
end
