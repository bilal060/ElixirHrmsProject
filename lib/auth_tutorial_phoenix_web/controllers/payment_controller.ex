defmodule AuthTutorialPhoenixWeb.PaymentController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Payment

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    payments = Accounts.list_payments()
    render(conn, "index.json", payments: payments)
  end

  def create(conn, %{"payment" => payment_params}) do
    with {:ok, %Payment{} = payment} <- Accounts.create_payment(payment_params) do
      client = Accounts.get_client!(payment_params["client_id"])
        employee1 = %{}
        Accounts.update_client(client, Map.put(employee1, :payment_id, payment.id))
      conn
      |> put_status(:created)
      |> render("show1.json", payment: payment)
    end
  end

  def show(conn, %{"id" => id}) do
    payment = Accounts.get_payment!(id)
    render(conn, "show.json", payment: payment)
  end

  def update(conn, %{"id" => id, "payment" => payment_params}) do
    payment = Accounts.get_payment!(id)

    with {:ok, %Payment{} = payment} <- Accounts.update_payment(payment, payment_params) do
      render(conn, "show.json", payment: payment)
    end
  end

  def delete(conn, %{"id" => id}) do
    payment = Accounts.get_payment!(id)

    with {:ok, %Payment{}} <- Accounts.delete_payment(payment) do
      send_resp(conn, :no_content, "")
    end
  end
end
