defmodule AuthTutorialPhoenixWeb.ClientView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.ClientView

  def render("index.json", %{clients: clients}) do
    %{data: render_many(clients, ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{data: render_one(client, ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{
      id: client.id,
      name: client.name,
      email: client.email,
      project_name: client.project_name,
      start_date: client.start_date,
      phone: client.phone,
      invoice: render_many(client.invoices, __MODULE__, "invoice.json", as: :invoice),
    #
  }
  end
  def render("invoice.json", %{invoice: invoice}) do
    %{
      invoice_no: invoice.invoice_no,
      type: invoice.type,
      amount: invoice.amount
    }
  end
end
