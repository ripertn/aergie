defmodule AergieWeb.TitleLiveTest do
  use AergieWeb.ConnCase

  import Phoenix.LiveViewTest
  import Aergie.WalletFixtures

  @create_attrs %{isin: "some isin", name: "some name", pru: 120.5, quantity: 42, type: "some type"}
  @update_attrs %{isin: "some updated isin", name: "some updated name", pru: 456.7, quantity: 43, type: "some updated type"}
  @invalid_attrs %{isin: nil, name: nil, pru: nil, quantity: nil, type: nil}

  defp create_title(_) do
    title = title_fixture()
    %{title: title}
  end

  describe "Index" do
    setup [:create_title]

    test "lists all titles", %{conn: conn, title: title} do
      {:ok, _index_live, html} = live(conn, Routes.title_index_path(conn, :index))

      assert html =~ "Listing Titles"
      assert html =~ title.isin
    end

    test "saves new title", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.title_index_path(conn, :index))

      assert index_live |> element("a", "New Title") |> render_click() =~
               "New Title"

      assert_patch(index_live, Routes.title_index_path(conn, :new))

      assert index_live
             |> form("#title-form", title: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#title-form", title: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.title_index_path(conn, :index))

      assert html =~ "Title created successfully"
      assert html =~ "some isin"
    end

    test "updates title in listing", %{conn: conn, title: title} do
      {:ok, index_live, _html} = live(conn, Routes.title_index_path(conn, :index))

      assert index_live |> element("#title-#{title.id} a", "Edit") |> render_click() =~
               "Edit Title"

      assert_patch(index_live, Routes.title_index_path(conn, :edit, title))

      assert index_live
             |> form("#title-form", title: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#title-form", title: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.title_index_path(conn, :index))

      assert html =~ "Title updated successfully"
      assert html =~ "some updated isin"
    end

    test "deletes title in listing", %{conn: conn, title: title} do
      {:ok, index_live, _html} = live(conn, Routes.title_index_path(conn, :index))

      assert index_live |> element("#title-#{title.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#title-#{title.id}")
    end
  end

  describe "Show" do
    setup [:create_title]

    test "displays title", %{conn: conn, title: title} do
      {:ok, _show_live, html} = live(conn, Routes.title_show_path(conn, :show, title))

      assert html =~ "Show Title"
      assert html =~ title.isin
    end

    test "updates title within modal", %{conn: conn, title: title} do
      {:ok, show_live, _html} = live(conn, Routes.title_show_path(conn, :show, title))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Title"

      assert_patch(show_live, Routes.title_show_path(conn, :edit, title))

      assert show_live
             |> form("#title-form", title: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#title-form", title: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.title_show_path(conn, :show, title))

      assert html =~ "Title updated successfully"
      assert html =~ "some updated isin"
    end
  end
end
