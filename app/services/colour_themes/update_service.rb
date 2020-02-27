class ColourThemes::UpdateService < BaseService
  attr_accessor :id
  attr_accessor :light
  attr_accessor :dark
  attr_accessor :highlight

  attr_accessor :colour_theme

  def call_after_validation
    update_colour_theme

    valid?
  end

  def update_colour_theme
    updated_details = {
      light: @light,
      dark: @dark,
      highlight: @highlight
    }
    @colour_theme.update!(updated_details)
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
