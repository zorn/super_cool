defmodule SuperCool.OauthManualDemoTest do
  @moduledoc """
  A semi-automated test script to help verify the OAuth2 flow.

  You can run this test script with this terminal command:

      $ source test.env; mix test test/super_cool/oauth_manual_demo_test.exs --include oauth_manual_demo --timeout 300000

  For this demonstration code base a successful URL to paste in when prompted is:

  https://super-cool-zorn.ngrok.dev/oauth/callback?code=abc123&state=zyx987
  """

  # We don't want this running alongside any others, so we'll use async: false.
  use ExUnit.Case, async: false

  alias SuperCool.Oauth

  @moduletag :oauth_manual_demo

  test "run demo" do
    instructions = """
    Because OAuth2 requires interaction with a web browser, we can't fully automate a headless test script for it, and so we offer this semi-automated demo instead.

    1. Before running this test you should have created a `test.env` file with the needed environment variables.

    2. Take the provided url and paste it into your browser. You'll be redirected to OAuth vendor to login.

    3. Read the auth prompt and make sure it makes sense for our use case.

    4. Click "Allow" button.

    5. You'll be redirected afterwords. Copy the the full url that you were redirected to and paste it back into this terminal below.
    """

    IO.puts(instructions)

    # Create URL and output it to the terminal.
    url = Oauth.authorize_url()
    IO.puts("Please copy and paste the following URL into your browser:\n\n#{url}\n\n")

    # Capture the return URL the user got.
    redirect_url_result =
      IO.gets("Please enter the URL that the vendor redirected you to after authorization:\n")
      |> String.trim()

    # Finalize the OAuth2 connection.
    uri = URI.new!(redirect_url_result)
    query_params = URI.decode_query(uri.query)
    {:ok, access_token} = Oauth.fetch_access_token_with_response(query_params)

    IO.puts(
      "Success! You can now use the access token #{inspect(access_token)} to make API calls."
    )
  end

end
