class Prankee < ActiveRecord::Base
  before_save :create_full_name, :format_number

  private

  def create_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end

  def format_number
    if self.phone_number[0..1] != "+1"
      self.phone_number = "+1" + self.phone_number
    end
    if self.phone_number.include?("-" || "(" || ")" || "." || " ") 
      phone = self.phone_number.tr("-", "")
      phone = phone.tr(")", "")
      phone =  phone.tr("(", "")
      phone =  phone.tr(".", "")
      phone =  phone.tr(" ", "")
      self.phone_number = phone
    else
      self.phone_number
    end
  end
end
