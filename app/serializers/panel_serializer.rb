class PanelSerializer < BaseSerializer
  attributes :id,
    :name,
    :colour_theme

    belongs_to :colour_theme
    has_many :tasks
end
