defmodule AuthTutorialPhoenixWeb.InvoiceView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.InvoiceView

  def render("index.json", %{invoices: invoices}) do
    %{data: render_many(invoices, InvoiceView, "invoice.json")}
  end

  def render("show.json", %{invoice: invoice}) do
    %{data: render_one(invoice, InvoiceView, "invoice1.json")}
  end

  def render("invoice.json", %{invoice: invoice}) do
    %{
      id: invoice.id,
      invoice_no: invoice.invoice_no,
      status: invoice.status,
      type: invoice.type,
      date: invoice.date,
      amount: invoice.amount,
      client: render_one(invoice.clients, __MODULE__, "client.json", as: :client),
    }
  end
  def render("client.json", %{client: client}) do
    %{
      id: client.id,
      name: client.name,
      project_name: client.project_name
    }
  end
  def render("show1.json", %{invoice: invoice}) do
    %{
      id: invoice.id
    }
  end
end
