class ColourThemes::CreateService < BaseService
  attr_accessor :light
  attr_accessor :dark
  attr_accessor :highlight

  attr_accessor :colour_theme

  def call_after_validation
    create_colour_theme

    valid?
  end

  def create_colour_theme
    @colour_theme = ColourTheme.create(
      light: @light,
      dark: @dark,
      highlight: @highlight
    )
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end

end
