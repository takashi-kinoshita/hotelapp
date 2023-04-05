class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "は日付形式で入力してください" }
  validates :check_out, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "は日付形式で入力してください" }
  validates :num_of_guests, presence: true, numericality: { only_integer: true, message: "は整数で入力してください" }
  
  validate :check_out_after_check_in

  def check_out_after_check_in
    return if check_out.blank? || check_in.blank?
    
    if check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付を選択してください")
    end
  end
  
  def total_price
    (check_out - check_in).to_i * room.price * num_of_guests
  end

  def total_days
    (check_out - check_in).to_i
  end

  def total_payment
    total_days * room.price
  end
  
  
end
