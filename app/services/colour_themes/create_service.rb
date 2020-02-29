class ColourThemes::CreateService < BaseService
  attr_accessor :light
  attr_accessor :dark
  attr_accessor :highlight
  attr_accessor :user

  attr_accessor :colour_theme

  validates :user, presence: true

  def call_after_validation
    create_colour_theme

    valid?
  end

  def create_colour_theme
    @colour_theme = ColourTheme.create(
      light: @light,
      dark: @dark,
      highlight: @highlight,
      user: @user
    )
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
