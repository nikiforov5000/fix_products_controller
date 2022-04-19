
class ProductsController < ApplicatinController

    def orders_products     # method in controllers/products_controller.rb
      orders = Order.all    # retreive all orders from DB
      products = orders.map(&:products).flatten 
        # orders is an array of objects
        # array maps into array of arrays order.products
        # flattens to a simple array of all products from every order
      @order_products = products.select do |product|
        product.order.id == params[:order_id]
            # filter the products array
                # id of product's order == id from user input form
      end
      # this method will return @order_products - 
      # array of products that belong to one order 
    end


    ####################################################################
    # order.rb added realtion has_many products
    # product.rb dded realtion has_one order
    def orders_products
        @order_products = Order.find(params[:order_id]).products
        # retreive array of product objects of Order.find(id) 
    end
  end