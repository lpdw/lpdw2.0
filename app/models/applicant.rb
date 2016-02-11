class Applicant < ActiveRecord::Base
  has_many :cursus, :class_name => 'Cursus', :foreign_key => 'id_applicant', :dependent => :destroy
  has_many :other_application, :class_name => 'OtherApplication', :foreign_key => 'id_applicant', :dependent => :destroy
  has_many :professional_experiences, :class_name => 'ProfessionalExperience', :foreign_key => 'id_applicant', :dependent => :destroy
  has_many :project_applicants, :class_name => 'ProjectApplicant', :foreign_key => 'id_applicant', :dependent => :destroy
  has_many :votes, :class_name => 'Vote', :foreign_key => 'id_applicant'
  has_one :applicant_status, :class_name => 'ApplicantStatus', :foreign_key => 'id_applicant'
  has_one :user, :class_name => 'User', :foreign_key => 'id_applicant'
  has_many :applicant_attachment, :class_name => 'ApplicantAttachment', :foreign_key => 'id_applicant', :dependent => :destroy

  validates_uniqueness_of :assurance, :message => "Ce numéro de sécurité sociale est déjà utilisé"
  validates_length_of :assurance, is: 15
  validates :name, :first_name, presence: true

  accepts_nested_attributes_for :cursus, :reject_if => lambda { |a| a[:place].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :applicant_attachment, :allow_destroy => true
  accepts_nested_attributes_for :other_application, :allow_destroy => true
  accepts_nested_attributes_for :professional_experiences, :allow_destroy => true
  accepts_nested_attributes_for :project_applicants, :allow_destroy => true
  accepts_nested_attributes_for :applicant_status, :votes

  #scope :by_year, lambda { |year| where("strftime('%Y', created_at) = ?", year.to_s) }
  scope :by_year, lambda { |year|
    adapter_type = connection.adapter_name.downcase.to_sym
    case adapter_type
    when /mysql/i
      where('extract(year from created_at) = ?', year)
    when :sqlite
      where("strftime('%Y', created_at) = ?", year.to_s)
    end
  }

  after_create :set_applicant_status

  def set_applicant_status
    self.create_applicant_status
  end

  def self.authenticate(email)
    @current = Applicant.find_by(email: email)
      return @current
  end

  def school_year
    first_year = created_at.year
    "#{first_year}/#{first_year+1}"
  end


  def self.all_years
    Applicant.pluck(:created_at).map {|created_at| created_at.year}.uniq.sort
  end
end
