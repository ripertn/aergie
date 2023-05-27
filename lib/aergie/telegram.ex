defmodule Telegram do

  @moduledoc """
  about webhook:
    https://core.telegram.org/bots/webhooks#the-short-version

    webhook cannot be used without a server and a domain name...


  """

  require Logger

  @token "5781449002:AAGCFq8neW0OaF9d2aaJnFe0hk9x86wa98A"
  @bot "aergie"
  @bot_name "aergie_bot"

  def info() do
    Logger.info("This module is currently not used")
    Logger.debug("token: #{@token}")
    Logger.debug("bot: #{@bot}")
    Logger.debug("bot_name: #{@bot_name}")
  end


end
