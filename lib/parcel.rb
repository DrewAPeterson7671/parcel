class Parcel
  attr_reader :id, :name, :dimensions, :weight
  attr_accessor :name, :dimensions, :weight
  @@parcels = {}
  @@total_rows = 0

  def initialize(name, id, dimensions, weight)
    @name = name
    @id = id || @@total_rows += 1
    @dimensions = dimensions
    @weight = weight

  end

  def self.all
    @@parcels.values()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.name, self.id, self.dimensions, self.weight)
  end

  def ==(parcel_to_compare)
    self.name() == parcel_to_compare.name()
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(name, dimensions, weight)
    self.name = name
    self.dimensions = dimensions
    self.weight = weight
    @@parcels[self.id] = Parcel.new(self.name, self.id, self.dimensions, self.weight)
  end

  def delete()
    @@parcels.delete(self.id)
  end
end
