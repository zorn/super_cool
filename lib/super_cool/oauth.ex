defmodule SuperCool.Oauth do
  # When using OAuth the client usually populates some known state
  # within the request. This state is returned back to us inside of the redirect.
  # https://auth0.com/docs/secure/attack-protection/state-parameters
  @known_state "zyx987"

  def authorize_url() do
    # Imagine a complex function that generates a real
    # OAuth URL where we want to send the user.

    "https://www.example.com/oauth/authorize?state=#{@known_state}"
  end

  def fetch_access_token_with_response(%{"code" => _code, "state" => state} = _params) do
    unless state == @known_state do
      {:error, :state_mismatch_in_response}
    end

    # Use the code to get an access token and do something with it.
    access_token = %{access_token: "abc123"}

    {:ok, access_token}
  end
end
