class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    # TODO: your code here

    buses = self.bus.inlcudes(:drivers)

    buses.each do |bus|
      all_drivers = []
      bus.drivers.each do |drivers|
        all_drivers << drivers
      end
      all_drivers[bus_id]  =
    end

    all
  end
end
