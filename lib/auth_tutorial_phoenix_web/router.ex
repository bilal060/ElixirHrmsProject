defmodule AuthTutorialPhoenixWeb.Router do
  use AuthTutorialPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  @derive Jason.Encoder


  pipeline :auth do
    plug AuthTutorialPhoenix.Guardian.AuthPipeline
  end

  scope "/api", AuthTutorialPhoenixWeb do
    pipe_through :api
    post "/users", UserController, :register
    get "/users", UserController, :index
    delete "/users/:id", UserController, :delete
    patch "/users/:id", UserController, :update
    get "/users/:id", UserController, :show
    post "/session/new", SessionController, :new
    resources "/permissions", PermissionController, except: [:new, :edit]
    resources "/profiles", ProfileController, except: [:new, :edit]
    resources "/companies", CompanyController, except: [:new, :edit]
    resources "/employees", EmployeeController, except: [:new, :edit]
    resources "/salaries", SalaryController, except: [:new, :edit]
    resources "/clients", ClientController, except: [:new, :edit]
    resources "/projects", ProjectController, except: [:new, :edit]
    resources "/payments", PaymentController, except: [:new, :edit]
    resources "/expenses", ExpenseController, except: [:new, :edit]
    resources "/departments", DepartmentController, except: [:new, :edit]
    resources "/leaves", LeaveController, except: [:new, :edit]
    resources "/invoices", InvoiceController, except: [:new, :edit]
    resources "/interviews", InterviewController, except: [:new, :edit]
    resources "/images", ImageController, except: [:new, :edit]
    resources "/attendances", AttendanceController, except: [:new, :edit]
  end
  scope "/api", AuthTutorialPhoenixWeb do
    pipe_through [:api, :auth]
    post "/session/refresh", SessionController, :refresh
    post "/session/delete", SessionController, :delete
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).


  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.

end
