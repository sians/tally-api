class Panels::CreateService < BaseService
  attr_accessor :colour_theme_id
  attr_accessor :name
  attr_accessor :user

  attr_accessor :panel

  validates :user, presence: true

  def call_after_validation
    create_panel

    valid?
  end

  def create_panel
    @panel = Panel.create(
      name: @name,
      colour_theme_id: 1,
      user: @user
    )
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
