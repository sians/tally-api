class Panels::DestroyService < BaseService
  attr_accessor :panel

  validates :panel, presence: true

  def call_after_validation
    destroy_panel

    valid?
  end

  def destroy_panel
    @panel.destroy
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
