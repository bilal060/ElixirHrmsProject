defmodule AuthTutorialPhoenixWeb.CompanyView do
  use AuthTutorialPhoenixWeb, :view
  alias AuthTutorialPhoenixWeb.CompanyView

  def render("index.json", %{companies: companies}) do
    %{data: render_many(companies, CompanyView, "company.json")}
  end

  def render("show.json", %{company: company}) do
    %{data: render_one(company, CompanyView, "company.json")}
  end

  def render("company.json", %{company: company}) do
    %{
      id: company.id,
      company_name: company.company_name
    }
  end
end
