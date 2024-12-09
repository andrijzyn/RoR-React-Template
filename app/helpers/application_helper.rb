module ApplicationHelper
  def flash_classes(flash_type)
    flash_base = "p-3 text-center text-white"
    {
      notice: "alert alert-primary #{flash_base}",
      error:  "alert alert-danger #{flash_base}",
      alert: "alert alert-warning #{flash_base}"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def nav_classes
    ["devise/registrations", "devise/sessions", "devise/confirmations", "devise/passwords", "devise/unlocks"].include?(params[:controller]) ? "d-none" : nil
  end

  def label_class(options = {})
    "form-label #{options[:extended_classes]}"
  end

  def input_class(options = {})
    "form-control #{options[:extended_classes]}"
  end

  def checkbox_class(options = {})
    "form-check-input #{options[:extended_classes]}"
  end

  def link_class(options = {})
    "text-decoration-underline text-dark #{options[:extended_classes]}"
  end

  def button_class(options = {})
    variant = options[:variant]
    theme = options[:theme]

    style_button(variant, theme_button(theme))
  end

  def theme_button(theme)
    themes = {
      primary: "primary",
      secondary: "secondary",
      transparent: "link",
      dark: "dark"
    }

    case theme
    when themes[:primary]
      "btn btn-primary"
    when themes[:secondary]
      "btn btn-secondary"
    when themes[:transparent]
      "btn btn-link"
    when themes[:dark]
      "btn btn-dark"
    else
      "btn btn-light"
    end
  end

  def style_button(variant, theme)
    case variant
    when "large"
      "#{theme} btn-lg"
    when "small"
      "#{theme} btn-sm"
    when "expanded"
      "#{theme} w-100"
    else
      theme
    end
  end
end
