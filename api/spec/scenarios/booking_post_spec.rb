describe "POST /equipos/{equipo_id}/bookings" do
    before(:all) do
        payload = {email: "anna@gmail.com", password: "pwd123"}
        result = Sessions.new.login(payload)
        @anna_id = result.parsed_response["_id"]
    end

    context "solicitar locacao" do
        before(:all) do
            result = Sessions.new.login({email: "bruna@gmail.com", password: "pwd123"})
            bruna_id = result.parsed_response["_id"]

            fender = {
                thumbnail: Helpers::get_thumb("fender-sb.jpg"),
                name: "Fender Strato",
                category: "Cordas",
                price: 150,
            }

            MongoDB.new.remove_equipo(fender[:name], bruna_id)
            result = Equipos.new.create(fender, bruna_id)
            fender_id = result.parsed_response["_id"]

            @result = Equipos.new.booking(fender_id, @anna_id)
        end

        it "valida status code 200" do
            expect(@result.code).to eql 200
        end
    end
end