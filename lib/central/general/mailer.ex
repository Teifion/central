defmodule Central.Mailer do
  use Swoosh.Mailer, otp_app: :central

  def noreply_address do
    Application.get_env(:central, Central.Mailer)[:noreply_address]
  end

  def contact_address do
    Application.get_env(:central, Central.Mailer)[:contact_address]
  end
end
