class RecordsCloseJob < ApplicationJob
  queue_as :default

  def perform(rec)
    rec.update_column(:status, 'Аукцион закрыт')
  end
end
