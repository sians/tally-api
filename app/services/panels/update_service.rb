class Panels::UpdateService < BaseService
  attr_accessor :colour_theme_id
  attr_accessor :id
  attr_accessor :name

  attr_accessor :panel

  def call_after_validation
    update_panel

    valid?
  end

  def update_panel
    updated_details = {
      colour_theme_id: @colour_theme_id,
      name: @name
    }
    @panel.update!(updated_details)
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
