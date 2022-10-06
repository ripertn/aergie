defmodule Aergie.WalletTest do
  use Aergie.DataCase

  alias Aergie.Wallet

  describe "titles" do
    alias Aergie.Wallet.Title

    import Aergie.WalletFixtures

    @invalid_attrs %{isin: nil, name: nil, pru: nil, quantity: nil, type: nil}

    test "list_titles/0 returns all titles" do
      title = title_fixture()
      assert Wallet.list_titles() == [title]
    end

    test "get_title!/1 returns the title with given id" do
      title = title_fixture()
      assert Wallet.get_title!(title.id) == title
    end

    test "create_title/1 with valid data creates a title" do
      valid_attrs = %{isin: "some isin", name: "some name", pru: 120.5, quantity: 42, type: "some type"}

      assert {:ok, %Title{} = title} = Wallet.create_title(valid_attrs)
      assert title.isin == "some isin"
      assert title.name == "some name"
      assert title.pru == 120.5
      assert title.quantity == 42
      assert title.type == "some type"
    end

    test "create_title/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wallet.create_title(@invalid_attrs)
    end

    test "update_title/2 with valid data updates the title" do
      title = title_fixture()
      update_attrs = %{isin: "some updated isin", name: "some updated name", pru: 456.7, quantity: 43, type: "some updated type"}

      assert {:ok, %Title{} = title} = Wallet.update_title(title, update_attrs)
      assert title.isin == "some updated isin"
      assert title.name == "some updated name"
      assert title.pru == 456.7
      assert title.quantity == 43
      assert title.type == "some updated type"
    end

    test "update_title/2 with invalid data returns error changeset" do
      title = title_fixture()
      assert {:error, %Ecto.Changeset{}} = Wallet.update_title(title, @invalid_attrs)
      assert title == Wallet.get_title!(title.id)
    end

    test "delete_title/1 deletes the title" do
      title = title_fixture()
      assert {:ok, %Title{}} = Wallet.delete_title(title)
      assert_raise Ecto.NoResultsError, fn -> Wallet.get_title!(title.id) end
    end

    test "change_title/1 returns a title changeset" do
      title = title_fixture()
      assert %Ecto.Changeset{} = Wallet.change_title(title)
    end
  end

  describe "items" do
    alias Aergie.Wallet.Item

    import Aergie.WalletFixtures

    @invalid_attrs %{isin: nil, name: nil, pru: nil, quantity: nil, type: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Wallet.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Wallet.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{isin: "some isin", name: "some name", pru: 120.5, quantity: 42, type: "some type"}

      assert {:ok, %Item{} = item} = Wallet.create_item(valid_attrs)
      assert item.isin == "some isin"
      assert item.name == "some name"
      assert item.pru == 120.5
      assert item.quantity == 42
      assert item.type == "some type"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wallet.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{isin: "some updated isin", name: "some updated name", pru: 456.7, quantity: 43, type: "some updated type"}

      assert {:ok, %Item{} = item} = Wallet.update_item(item, update_attrs)
      assert item.isin == "some updated isin"
      assert item.name == "some updated name"
      assert item.pru == 456.7
      assert item.quantity == 43
      assert item.type == "some updated type"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Wallet.update_item(item, @invalid_attrs)
      assert item == Wallet.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Wallet.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Wallet.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Wallet.change_item(item)
    end
  end
end
