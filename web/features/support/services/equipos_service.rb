require_relative "base_service"

class EquiposService < BaseService
    def create(equipo, user_id)
        payload = equipo

        self.class.post(
            "/equipos",
            body: payload,
            headers: {
                "user_id": user_id
            },
        )
    end

    def booking(equipo_id, user_renter_id)
        return self.class.post(
            "/equipos/#{equipo_id}/bookings",
            body: {date: Time.now.strftime("%d/%m/%Y")}.to_json,
            headers: {
                "Content-Type": "application/json",
                "user_id": user_renter_id,
            },
        )
    end
end