class Tweet < ApplicationRecord
  belongs_to(:user)
    validates(:title,
            presence: true,
            uniqueness: true)
            # exclusion: ['Cody sucks', 'Cody is not the best teacher'],
            # format: {without: /e{2}/},
            # inclusion: ['Cody is wonderful', 'Cody is the best teacher'],
            # length: {maximum: 5},
            # numericality: true)

  # validates_numericality_of(:title,
  #                           only_integer: true,
  #                           greater_than: 5)

  validates(:body,
            presence: true,
            length: {maximum: 15})

  has_attached_file(:photo, 
                    :styles =>{ 
                      :medium => "300x300>", 
                      :thumb => "100x100>" },
                      :default_url => "/assets/:style/missing.png",
                      storage: :s3,
                      s3_region: 'us-east-1',
                      s3_credentials: {bucket: 'the-better-fake-twitter-october-2016',
                                       access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                       secret_access_key: ENV['AWS_SECRET_ASCCESS_KEY']})

# AKIAJDUHHAFC4KHPV3QQ
# WrpyKQVeQMrOdlb0Lm4ubBdAr/v84qhFFpyEd00w

validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


end
