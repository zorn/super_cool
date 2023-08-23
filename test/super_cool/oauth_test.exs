defmodule SuperCool.OauthTest do
  use ExUnit.Case

  alias SuperCool.Oauth

  describe "authorize_url/0" do
    # This is a test that requires know interaction to verify.
    test "success: returns a URL" do
      assert "https://www.example.com/oauth/authorize" <> _ = Oauth.authorize_url()
    end
  end
end
