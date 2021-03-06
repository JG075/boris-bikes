require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :bike_rack
  attr_accessor :capacity
  attr_accessor :bike_rack_broken

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike_rack = []
    @bike_rack_broken = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    @bike_rack.pop
  end

  def dock(bike)
    raise"Docking station full" if full?
    bike.working? ? @bike_rack << bike : @bike_rack_broken << bike
  end

  def send_bikes
    temp_var = @bike_rack_broken
    @bike_rack_broken =  []
    return temp_var
  end

  def receive_bikes(working_bikes)
    working_bikes.each do |x|
      @bike_rack << x
    end
    true
  end

  private

    def full?
      @bike_rack.count >= @capacity
    end

    def empty?
      @bike_rack.empty?
    end
end
