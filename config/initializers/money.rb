# https://github.com/RubyMoney/money#deprecation
Money.locale_backend = :currency

MoneyRails.configure do |config|
  config.default_currency = :sgd  # or :gbp, :usd, etc.
  # [...]
end
