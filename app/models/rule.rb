class Rule < ActiveRecord::Base
  acts_as_followable

  permit_params :title, :kind, :institution_id, :filing_at, :deadline_comments, :for_comments,
    attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at]
  belongs_to :institution
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :attachments, allow_destroy: true

  scope :inactive, -> { where("deadline_comments < ?", Date.today) }
  scope :active, -> { where("deadline_comments >= ? OR deadline_comments IS NULL", Date.today) }

  after_create :new_rule_notification

  private
    def new_rule_notification
      UserMailer.set_recipients_new_rule(self)
    end
end
