defmodule AuthTutorialPhoenixWeb.PaymentView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.PaymentView

  def render("index.json", %{payments: payments}) do
    %{data: render_many(payments, PaymentView, "payment.json")}
  end

  def render("show.json", %{payment: payment}) do
    %{data: render_one(payment, PaymentView, "payment.json")}
  end
  def render("show1.json", %{payment: payment}) do
    %{data: render_one(payment, PaymentView, "payment1.json")}
  end
  def render("payment1.json", %{payment: payment}) do
    %{
      id: payment.id,
    }
  end
  def render("payment.json", %{payment: payment}) do
    %{
      id: payment.id,
      amount: payment.amount,
      type: payment.type,
      date: payment.date,
      client: render_one(payment.clients, __MODULE__, "client.json", as: :client),
    }
  end
  def render("client.json", %{client: client}) do
    %{
     id: client.id,
     name: client.name,
     email: client.email,
     project_name: client.project_name,
    }
  end
end
