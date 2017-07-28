class Rule < ActiveRecord::Base
  acts_as_followable

  belongs_to :institution
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy

  #
  accepts_nested_attributes_for :attachments, allow_destroy: true
  #accepts_nested_attributes_for :tags, :attachments, allow_destroy: true

  scope :inactive, -> { where("deadline_comments < ?", Date.today) }
  scope :active, -> { where("deadline_comments >= ? OR deadline_comments IS NULL", Date.today) }

  after_create :new_rule_notification

  private
    def new_rule_notification
      UserMailer.set_recipients_new_rule(self)
    end
end
