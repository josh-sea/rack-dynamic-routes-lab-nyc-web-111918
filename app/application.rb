class Application

@@items = []
  def call(env)
   resp = Rack::Response.new
   req = Rack::Request.new(env)


   if req.path.match(/items/)
      item_name = req.path.split("/items/").last #turn /items/item_name as item name
      item_inst  = @@items.find{|item| item.name == item_name}
      if item_inst == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write item_inst.price
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
   resp.finish
 end
end
