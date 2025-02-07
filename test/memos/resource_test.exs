defmodule Memos.ResourceTest do
  use Memos.DataCase

  alias Memos.Resource

  describe "posts" do
    alias Memos.Resource.Post

    import Memos.ResourceFixtures

    @invalid_attrs %{title: nil, body: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Resource.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Resource.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{title: "some title", body: "some body"}

      assert {:ok, %Post{} = post} = Resource.create_post(valid_attrs)
      assert post.title == "some title"
      assert post.body == "some body"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Resource.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body"}

      assert {:ok, %Post{} = post} = Resource.update_post(post, update_attrs)
      assert post.title == "some updated title"
      assert post.body == "some updated body"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Resource.update_post(post, @invalid_attrs)
      assert post == Resource.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Resource.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Resource.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Resource.change_post(post)
    end
  end
end
