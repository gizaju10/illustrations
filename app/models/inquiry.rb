class Inquiry < ApplicationRecord
    include ActiveModel::Model

    attr_accessor :name, :email, :message
  
    validates :name, presence: {message: 'を入力してください'}
    validates :email, presence: {message: 'を入力してください'}
    validates :message, presence: {message: 'を入力してください'}
end