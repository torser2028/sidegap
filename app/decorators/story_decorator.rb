class StoryDecorator < Draper::Decorator
  delegate :title, :body, :created_at, :project_rule

  def created_at
    object.created_at.strftime(I18n.t("date.formats.default"))
  end
end
