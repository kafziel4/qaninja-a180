describe "POST /sessions" do
    context "login com sucesso" do
        before(:all) do
            payload = { email: "gabriela@gmail.com", password: "pwd123" }
            @result = Sessions.new.login(payload)
        end

        it "valida status code 200" do
            expect(@result.code).to eql 200
        end

        it "valida id do usuario" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end
    
=begin
    examples = [
        {
            title: "senha invalida",
            payload: { email: "gabriela@gmail.com", password: "abc123" },
            code: 401,
            error: "Unauthorized",
        },
        {
            title: "usuario nao existe",
            payload: { email: "gabi@gmail.com", password: "pwd123" },
            code: 401,
            error: "Unauthorized",
        },
        {
            title: "email em branco",
            payload: { email: "", password: "pwd123" },
            code: 412,
            error: "required email",
        },
        {
            title: "sem o campo email",
            payload: { password: "pwd123" },
            code: 412,
            error: "required email",
        },
        {
            title: "senha em branco",
            payload: { email: "gabriela@gmail.com", password: "" },
            code: 412,
            error: "required password",
        },
        {
            title: "sem o campo senha",
            payload: { email: "gabriela@gmail.com" },
            code: 412,
            error: "required password",
        },
    ]
=end

examples = Helpers::get_fixture("login")

    examples.each do |e|
        context "#{e[:title]}" do
            before(:all) do
                @result = Sessions.new.login(e[:payload])
            end

            it "valida status code #{e[:code]}" do
                expect(@result.code).to eql e[:code]
            end

            it "valida mensagem de erro" do
                expect(@result.parsed_response["error"]).to eql e[:error]
            end
        end
    end
end