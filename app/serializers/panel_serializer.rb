class PanelSerializer < BaseSerializer
  attributes :id,
    :name

    belongs_to :colour_theme
    has_many :tasks
end
