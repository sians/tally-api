class ColourThemes::DestroyService < BaseService
  attr_accessor :colour_theme

  def call_after_validation
    destroy_colour_theme

    valid?
  end

  def destroy_colour_theme
    @colour_theme.destroy
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
