module Admin::ReservationsHelper

  def limited(num)
    seat.limit(num)
  end
end
