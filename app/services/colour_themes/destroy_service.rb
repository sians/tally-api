class ColourThemes::DestroyService < BaseService
  attr_accessor :id

  def call_after_validation
    destroy_colour_theme

    valid?
  end

  def destroy_colour_theme
    colour_theme = ColourTheme.find(@id)
    colour_theme.destroy
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
