class RootApp < BaseApp
  get "/:id" do
    @user = User.find_by id: params[:id]
    if @user
      json response: {
        status: :ok,
        errors: [],
        data: @user,
        request: params,
        redirect: nil
      }
    else
      json response: {
        status: :fail,
        errors: [
          "User #{params[:id]} does not exist"
        ],
        data: [],
        request: params,
        redirect: nil
      }
    end
  end
  
  get "/" do
    @user = User.find_by id: @body[:id]
    if @user
      json response: {
        status: :ok,
        errors: [],
        data: @user,
        request: params,
        redirect: nil
      }
    else
      json response: {
        status: :fail,
        errors: [
          "User #{params[:id]} does not exist"
        ],
        data: [],
        request: params,
        redirect: nil
      }
    end
  end
  
  post '/' do
    @user = User.create username: @body[:username],
                        password: @body[:password],
                        email: @body[:email]
    if @user.valid?
      json response: {
        status: :ok,
        errors: [],
        data: @user,
        request: @body,
        redirect: "/#{@user.id}"
      }
    else
      json response: {
        status: :fail,
        errors: @user.errors,
        data: [],
        request: @body,
        redirect: "/"
      }
    end
  end
end