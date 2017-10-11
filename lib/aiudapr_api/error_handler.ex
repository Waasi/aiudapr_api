defmodule AiudaprApi.ErrorHandler do
  def format(errors) do
    Enum.map(errors, &format_error/1)
  end

  defp format_error({key, {msg, _opts}}) do
    %{message: msg, field: key}
  end
end
