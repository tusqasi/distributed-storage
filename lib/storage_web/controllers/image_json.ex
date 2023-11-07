defmodule StorageWeb.ImageJSON do
  def last_n_data(%{images: s}) do
  
    %{
      images: s |> Enum.map(fn [x ]-> x end) 
     }
     |> IO.inspect()
  end
end
