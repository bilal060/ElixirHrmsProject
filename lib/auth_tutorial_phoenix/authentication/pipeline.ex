defmodule AuthTutorialPhoenix.Guardian.AuthPipeline  do
  @claims %{typ: "access"}

  use Guardian.Plug.Pipeline,
    otp_app: :auth_tutorial_phoenix,
    module: AuthTutorialPhoenix.Guardian,
    error_handler: AuthTutorialPhoenix.Guardian.AuthErrorHandler

  plug Guardian.Plug.VerifySession, claims: @claims
  plug Guardian.Plug.VerifyHeader, claims: @claims, scheme: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
