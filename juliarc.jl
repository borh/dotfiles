@async begin
    sleep(0.1)
    @eval using Revise
end

ENV["EDITOR"] = "emacsclient"
