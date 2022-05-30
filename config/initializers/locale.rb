# I18nライブラリに訳文の探索場所を指示する
# I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb, yml}')]

# アプリケーションでの利用を許可するロケールのリストを渡す
I18n.available_locales = [:en, :es]

I18n.default_locale = :en

LANGUAGE = [
  ["English", "en"],
  ["Espa&ntilde;ol".html_safe, "es"]
]
