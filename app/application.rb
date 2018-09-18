class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      if !@@cart.empty?
        resp.write "Your cart includes:"
        @@cart.each do |item|
          resq.write "#{item}\n"
        end
      else
        resq.write "Your cart is empty"
    elsif req.path.match(/add/)
      newItem = req.params["item"]
      if @@items.includes?(newItem)
        @@cart << newItem
        resp.write "We adde #{newItem}"
      else
        resp.write "We don't have that item"
      end
    else

      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end


  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
