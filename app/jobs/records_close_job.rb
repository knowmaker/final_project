# frozen_string_literal: true

# class RecordsCloseJob
class RecordsCloseJob < ApplicationJob
  queue_as :default

  def perform(rec)
    rec.update_column(:status, 'Аукцион закрыт')
    maxuser = rec.comments.select(:username).order(cost: :desc, created_at: :asc).first.username
    rec.comments.where.not(username: maxuser).each do |item|
      @usr = User.find_by(email: item.username)
      @usr.balance += item.cost
      @usr.save
    end
    #rec.update_column(:timeend,Time.now)
  end
end
