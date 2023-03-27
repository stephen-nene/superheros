class Hero < ApplicationRecord
  has_many :hero_powers
  has_many :powers, through: :hero_powers

  def as_json(options={})
    super(options.merge(
      except: [:created_at, :updated_at],
      include: {
        powers: {
          except: [:created_at, :updated_at]
        }
      }
    ))
  end
  
end
