#!mruby

sb = nil

def restart_sandbox
  sb = Sandbox.new
  sb.eval "def method_missing(*x, &b); 'http://file.mmametal.blog.shinobi.jp/Mirko_CroCop01.jpg'; end"
  sb
end

def sandbox_eval(expr)
  unless expr
    sb = restart_sandbox
    return 'mruby_bot sandbox restarted'
  end
  sb = restart_sandbox unless sb
  sb.eval expr
end

def issue(id)
  ret = ''
  if id && id.to_i != 0
    res = Curl::get "https://api.github.com/repos/mruby/mruby/issues/#{id}"
    json = JSON::parse res.body
    ret = "#{json['title']}\n#{json['html_url']}\n#{json['body']}\n"[0..999]
  else
    res = Curl::get "https://api.github.com/repos/mruby/mruby/issues?per_page=5"
    JSON::parse(res.body).each do |json|
      ret += "#{json['title']}\n#{json['html_url']}\n"
    end
  end
  ret
end

def weather(area)
  return '' unless area
  res = Curl::get "http://openweathermap.org/data/2.1/find/name?q=#{area}"
  json = JSON::parse res.body
  if json.has_key? 'list'
    return "#{Time.at(json['list'][0]['dt'].to_f)}\nhttp://openweathermap.org/img/w/#{json['list'][0]['weather'][0]['icon']}.png"
  end
  json['message']
end

get "/lingr" do |r, param|
  "ワシもmrubyじゃ"
end

post "/lingr" do |r, param|
  json = JSON.parse r.body
  ret = ''
  json["events"].each do |e|
    if e["message"] && e["message"]["text"]
      cmd, msg = e["message"]["text"].split(" ", 2)
      ret = case cmd
      when '!mruby'
        sandbox_eval msg
      when '!issue'
        issue msg
      when '!weather'
        weather msg
      else
        ''
      end
    end
  end
  ret
end

Sinatic.run(:port => 5003)
