class Prankee < ActiveRecord::Base
  before_save :create_full_name

  private

  def create_full_name
    self.full_name = "#{self.first_name} #{self.last_name}"
  end
end
