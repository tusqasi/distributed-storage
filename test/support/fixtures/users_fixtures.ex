defmodule Storage.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Storage.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        password: "some password",
        username: "some username"
      })
      |> Storage.Users.create_user()

    user
  end
end
