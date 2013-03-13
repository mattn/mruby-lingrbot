#!mruby

sb = Sandbox.new

get "/lingr" do |r, param|
  "ワシもmrubyじゃ"
end

post "/lingr" do |r, param|
  json = JSON.parse(r.body)
  ret = ''
  json["events"].each do |e|
    if e["message"] && e["message"]["text"]
      m = e["message"]["text"].split(" ", 2)
      if m[0] == '!mruby'
        if m.size == 1
          ret = 'ワシがmrubyじゃ'
        elsif m.size == 2
          ret = sb.eval(m[1])
        end
      end
    end
  end
  ret
end

Sinatic.run :port => 8888
