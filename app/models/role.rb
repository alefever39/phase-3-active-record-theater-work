class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map { |audition| audition.actor }
  end

  def locations
    self.auditions.map { |audition| audition.location }
  end

  def lead
    hired_actors = self.auditions.select { |audition| audition.hired == true }

    if hired_actors.count == 0
      "no actor has been hired for this role"
    else
      hired_actors.first
    end
  end

  def understudy
    hired_actors = self.auditions.select { |audition| audition.hired == true }

    if hired_actors.count <= 1
      "no actor has been hired for understudy for this role"
    else
      hired_actors.second
    end
  end
end

# Role#actors returns an array of names from the actors associated with this role
# Role#locations returns an array of locations from the auditions associated with this role
# Role#lead returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
# Role#understudy returns the second instance of the audition that was hired for this role or returns a string 'no actor has been hired for understudy for this role'
