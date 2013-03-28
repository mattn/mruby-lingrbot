#!mruby

def restart_sandbox
  sb = Sandbox.new
  sb.eval "def method_missing(*x, &b); 'http://file.mmametal.blog.shinobi.jp/Mirko_CroCop01.jpg'; end"
  sb
end

sb = restart_sandbox

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
          sb = restart_sandbox
          ret = 'mruby_bot sandbox restarted'
        elsif m.size == 2
          ret = sb.eval(m[1])
        end
      elsif m[0] == '!issue'
        if m[1] && m[1].to_i != 0
          res = Curl::get("https://api.github.com/repos/mruby/mruby/issues/#{m[1]}")
          json = JSON::parse(res.body)
          ret = "#{json['title']}\n#{json['html_url']}\n#{json['body']}\n"[0..999]
        else
          res = Curl::get("https://api.github.com/repos/mruby/mruby/issues?per_page=5")
          JSON::parse(res.body).each do |json|
            ret += "#{json['title']}\n#{json['html_url']}\n"
          end
        end
      elsif m[0] == '!weather' && m[1]
        res = Curl::get "http://openweathermap.org/data/2.1/find/name?q=#{m[1]}"
        json = JSON::parse(res.body)
        if json.has_key?('list')
          ret = "#{Time.at(json['list'][0]['dt'].to_f)}\nhttp://openweathermap.org/img/w/#{json['list'][0]['weather'][0]['icon']}.png"
        else
          ret = json['message']
        end
      end
    end
  end
  ret
end

Sinatic.run(:port => 5003)
