class RecordsCloseJob < ApplicationJob
  queue_as :default

  def perform(rec)
    rec.update_column(:status, 'Аукцион закрыт')
    #maxc=rec.comments.maximum("cost")
    p rec.comments.select("username")
  end
end
