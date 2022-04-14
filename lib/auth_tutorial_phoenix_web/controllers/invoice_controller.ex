defmodule AuthTutorialPhoenixWeb.InvoiceController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Invoice

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    invoices = Accounts.list_invoices()
    render(conn, "index.json", invoices: invoices)
  end

  def create(conn, %{"invoice" => invoice_params}) do
    with {:ok, %Invoice{} = invoice} <- Accounts.create_invoice(invoice_params) do
      conn
      |> put_status(:created)
      |> render("show1.json", invoice: invoice)
    end
  end

  def show(conn, %{"id" => id}) do
    invoice = Accounts.get_invoice!(id)
    render(conn, "show.json", invoice: invoice)
  end
  
  def update(conn, %{"id" => id, "invoice" => invoice_params}) do
    invoice = Accounts.get_invoice!(id)

    with {:ok, %Invoice{} = invoice} <- Accounts.update_invoice(invoice, invoice_params) do
      render(conn, "show.json", invoice: invoice)
    end
  end

  def delete(conn, %{"id" => id}) do
    invoice = Accounts.get_invoice!(id)

    with {:ok, %Invoice{}} <- Accounts.delete_invoice(invoice) do
      send_resp(conn, :no_content, "")
    end
  end
end
