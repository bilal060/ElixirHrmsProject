defmodule AuthTutorialPhoenixWeb.CompanyController do
  use AuthTutorialPhoenixWeb, :controller

  alias AuthTutorialPhoenix.Accounts
  alias AuthTutorialPhoenix.Accounts.Company

  action_fallback AuthTutorialPhoenixWeb.FallbackController

  def index(conn, _params) do
    companies = Accounts.list_companies()
    render(conn, "index.json", companies: companies)
  end

  # def create(conn, %{"company" => company_params}) do
  #   with {:ok, %Company{} = company} <- Accounts.create_company(company_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.company_path(conn, :show, company))
  #     |> render("show.json", company: company)
  #   end
  # end
  def create(conn, %{"company" => company_params}) do
    with {:ok, %Company{} = company} <- Accounts.create_company(company_params) do

      conn
      |> put_status(:created)
      |> text("User is Registered successfully:" <> " " <> company.company_name)

    end
  end


  def show(conn, %{"id" => id}) do
    company = Accounts.get_company!(id)
    render(conn, "show.json", company: company)
  end

  def update(conn, %{"id" => id, "company" => company_params}) do
    company = Accounts.get_company!(id)

    with {:ok, %Company{} = company} <- Accounts.update_company(company, company_params) do
      render(conn, "show.json", company: company)
    end
  end

  def delete(conn, %{"id" => id}) do
    company = Accounts.get_company!(id)

    with {:ok, %Company{}} <- Accounts.delete_company(company) do
      send_resp(conn, :no_content, "")
    end
  end
end
