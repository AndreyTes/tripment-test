class Procedure < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  def self.search(search)
    order_condition = Procedure.sanitize_sql_array(['CASE WHEN (title ILIKE ?) THEN 0 ELSE 1 END', "#{search}%"])
    Procedure.where('title ILIKE ?', "%#{search}%").order(order_condition)
  end

end
