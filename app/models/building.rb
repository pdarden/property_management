class Building < ActiveRecord::Base
  validates_presence_of :street_address, :city, :postal_code

  validates_length_of :postal_code,
    minimum: 5

  validates_numericality_of :postal_code,
    only_integer: true

  belongs_to :state,
    inverse_of: :bulidings

  belongs_to :owner,
    inverse_of: :bulidings

  def owner_name
    if !self.owner_id.blank?
      Owner.find(self.owner_id).first_name + ' ' + Owner.find(self.owner_id).last_name
    else
      nil
    end
  end

  def state_name
    State.find(self.state_id).name
  end
end
