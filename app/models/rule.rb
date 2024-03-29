class Rule < ActiveRecord::Base
  acts_as_followable

  belongs_to :institution
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :attachments, allow_destroy: true
  # accepts_nested_attributes_for :tags, :attachments, allow_destroy: true

  scope :inactive, -> { status_inactive.where('deadline_comments < ? OR status IS FALSE', Date.today).includes(:institution) }
  scope :active, -> { status_active.where('deadline_comments >= ? OR deadline_comments IS NULL', Date.today) }
  scope :status_active, -> { where(status: true) }
  scope :status_inactive, -> { where(status: false) }

  after_create :new_rule_notification

  private

  def new_rule_notification
    # institution_id = institution.id
    # recipients = UserNotification.includes(:user, :institution).where(institution_id: institution_id).map(&:user).to_a
    # recipients.each do |recipient|
    #   UserMailer.new_rule(recipient, institution, self).deliver_now
    # end
    UserMailer.set_recipients_new_rule(self)
  end
end
