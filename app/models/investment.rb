class Investment < ActiveRecord::Base
  belongs_to :portfolio
  has_many :portfolios
  belongs_to :company
  def worth_at_cost
    worth=cost*quantity
    return worth
  end
  def worth_today
    quantity*company.price
  end
  validate :cost_should_be_positive
  def cost_should_be_positive
    if cost < 0
      errors.add :cost,'should be positive'
    end
end
end
