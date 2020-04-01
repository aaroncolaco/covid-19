defmodule Notifier.SMS do
  # @api Application.fetch_env!(:notifier, :sms_url)

  require Logger

  def send_sms(to, state, country) do
    
    message = build_sms(country, state)

    Logger.info("Sent #{message} to #{to}")
    :ok
  end

  defp build_sms(state, country) do
    {:ok, country_stats} = Notifier.Stats.get_stats_for_country(country)
    {:ok, state_stats} = Notifier.Stats.get_stats_for_state(state)

    """
    Country: #{country}
    Total: #{country_stats[:total]}
    Cured: #{country_stats[:cured]}
    Deaths: #{country_stats[:deaths]}
    New: + #{country_stats[:new]}
    Cured: + #{country_stats[:new_cured]}
    Deaths: + #{country_stats[:new_deaths]}
    ---
    State: #{state}
    Total: #{state_stats[:total]}
    Cured: #{state_stats[:cured]}
    Deaths: #{state_stats[:deaths]}
    New: + #{state_stats[:new]}
    Cured: + #{state_stats[:new_cured]}
    Deaths: + #{state_stats[:new_deaths]}
    """
  end
end