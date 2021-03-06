class Council < ActiveRecord::Base
  acts_as_followable
  acts_as_votable

  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :councillor_assignments, dependent: :destroy
  has_many :councillors, through: :councillor_assignments

  accepts_nested_attributes_for :attachments, :councillor_assignments, allow_destroy: true

  scope :as_author, -> { joins(:councillor_assignments).merge(CouncillorAssignment.authors).uniq }
  scope :as_speaker, -> { joins(:councillor_assignments).merge(CouncillorAssignment.speakers).uniq }
  scope :approved, -> { where(status: 'Aprobado') }
  scope :old, -> { where(status: %w(Archivado Retirado)) }

  before_update :update_monitoring_date

  private
    def update_monitoring_date
      self.monitoring_at = Date.today
    end

end
