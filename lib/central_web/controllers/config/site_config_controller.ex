defmodule CentralWeb.Config.SiteConfigController do
  use CentralWeb, :controller

  alias CentralWeb.Config.SiteConfig
  alias CentralWeb.Config.SiteConfig.Cache
  alias CentralWeb.Config.SiteConfigLib

  plug :authorize!, CentralWeb.General.Admin.Auth

  # plug :add_breadcrumb, name: 'Alacrity', url: '/'
  plug :add_breadcrumb, name: 'Admin', url: '/admin'
  plug :add_breadcrumb, name: 'Site config', url: '/config/site'

  def index(conn, _params) do
    user = conn.assigns[:current_user]

    site_configs = Config.get_grouped_configs(user)

    conn
    |> assign(:site_configs, site_configs)
    |> render("index.html")
  end

  def edit(conn, %{"id" => id}) do
    site_config = Repo.get_by(SiteConfig, %{key: id})

    case site_config do
      nil ->
        conn
        |> put_flash(:danger, "Cannot find site config '#{id}'")
        |> redirect(to: site_config_path(conn, :index))

      _ ->
        site_config_full = get_site_config(id, :full)
        changeset = SiteConfig.update_changeset(site_config)

        conn
        |> assign(:site_config, site_config)
        |> assign(:changeset, changeset)
        |> assign(:site_config_full, site_config_full)
        |> render("edit.html")
    end
  end

  def update(conn, %{"id" => id, "site_config" => site_config_params}) do
    site_config = Repo.get!(SiteConfig, id)
    changeset = SiteConfig.update_changeset(site_config, site_config_params)

    case Repo.update(changeset) do
      {:ok, site_config} ->
        Cache.update(site_config.key, site_config.value)

        tab = site_config.key
        |> String.split(".")
        |> hd

        conn
        |> put_flash(:info, "Site config '#{site_config.key}' updated successfully.")
        |> redirect(to: site_config_path(conn, :index) <> "##{tab}")
    end
  end
end
