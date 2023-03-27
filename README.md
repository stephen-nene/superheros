# PIZZA - TRACKER

## Description
- The Pizza Tracker API is designed to track the different types of pizzas offered by various restaurants. The application has three main resources - `Restaurant`, `Pizza`, and `RestaurantPizza`. The `Restaurant` model represents a restaurant that offers `pizzas`, while the Pizza model represents the different types of pizzas that can be ordered from restaurants. The `RestaurantPizza` model acts as a join table between the `Restaurant` and `Pizza` models, allowing for the association between the two.

- This API will allow users to perform various **CRUD** operations such as **adding** new `restaurants` and `pizzas`, **updating** and **deleting** existing `restaurants` and `pizzas`, and **retrieving** information on specific `restaurants` and `pizzas`. However, this API is not intended to handle any payment processing or any other advanced features that may be required for a full-fledged e-commerce platform.
# Technologies used

  ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)  ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)  ![Git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

  ![Markdown](https://img.shields.io/badge/markdown-%23000000.svg?style=for-the-badge&logo=markdown&logoColor=white)  ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)  ![SQLite](https://img.shields.io/badge/sqlite3-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white)

  ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)  ![json](https://img.shields.io/badge/json-5E5C5C?style=for-the-badge&logo=json&logoColor=white)


  ![Stack Overflow](https://img.shields.io/badge/-Stackoverflow-FE7A16?style=for-the-badge&logo=stack-overflow&logoColor=white)


# Get-started
1. First **fork** this repository to your github account.
2. **Git clone** to your local machine
    ```bash
        git clone https://github.com/stephen-nene/pizza-tracker.git
    ```
3. Run bundle install and bundle update to install necessary dependencies.
    ```sh
    bundle install
    bundle update
    ```
 <!-- - If the above commands bring an error try appending bundle exec.
    ```sh
        bundle exec -->
4. Run any pending migrations and seed if necessary
    ```ruby
    rails db:migrate db:seed
    ```
5. Start the server
    ```ruby
    rails s
    ```
6. Navigate to your **[localhost](http://localhost:3000/)** and try out the endpoints

# Tables

| Pizzas|      Restaurant| RestaurantPizzas|
|-|  -|-|
|id (**pk**)|id (**pk**) | id (**pk**)|
|name|name | pizza_id (**FK**)   |
|ingredients|address| restaurant_id (**FK**)|

-This diagram shows the relationships between the `Pizzas`, `Restaurants`, and `RestaurantPizzas` tables. The `Pizzas` table has a one-to-many relationship with the `RestaurantPizzas` table, as each `pizza` can be sold at multiple `restaurants`. Similarly, the `Restaurants` table also has a one-to-many relationship with the `RestaurantPizzas` table, as each restaurant can sell multiple pizzas. The `RestaurantPizzas` table acts as a bridge table between `Pizzas` and `Restaurants`, allowing for a many-to-many relationship between them.



# Routes

### A. <u>pizza</u>
- These are HTTP methods used for interacting with a hypothetical API that deals with pizza-related data. Here's a breakdown of each one:

1. **` GET /pizzas`**
    - This API endpoint retrieves a list of all available pizzas. The **HTTP GET** method is used to request data from the server, and the /pizzas endpoint specifies the resource being requested.
2. **`GET /pizzas/:id`**
   -  This API endpoint retrieves a specific pizza with the provided ID. The `:id` parameter in the endpoint is a placeholder for a unique identifier for the pizza. For example, `GET /pizzas/1` would retrieve the pizza with ID 1.
3. **`POST /pizzas`**
    - This API endpoint is used to create a new pizza. The HTTP POST method is used to send data to the server, and the `/pizzas `endpoint specifies where the data should be sent. The data sent in the request body would contain the details of the new pizza.
4. **`DELETE /pizzas/:id`**
    -  This API endpoint deletes a specific pizza with the provided ID. The `:id` parameter in the endpoint is a placeholder for the unique identifier for the pizza to be deleted. For example, `DELETE /pizzas/1 `would delete the pizza with ID 1.


### B. <u>Restaurant</u>
1. **`GET /restaurants`**
    - This endpoint returns a list of all the restaurants available in the system. It return a json with the restaurant's name and address .
2. **`GET /restaurants/:id`**
    -  This endpoint returns a specific restaurant based on its ID. The ID is usually a unique identifier assigned to each restaurant in the system.  It return a json with the restaurant's name and address for that specific restaurant's id.
4. **`POST /restaurants`**
    - This endpoint is used to create a new restaurant in the system. The request includes information like the restaurant's name and address.
3. **`DELETE /restaurants/:id`**
    -  This endpoint is used to delete a specific restaurant based on its ID. The ID is usually a unique identifier assigned to each restaurant in the system. Once the request is processed, the restaurant will be removed from the system.



### C. <u>RestaurantPizza</u>
1. **`GET /restaurants/:id/pizzas`**
    - This endpoint would retrieve all the pizzas of a specific restaurant with the given `id`.
2. **`GET /restaurants/:id/pizzas/:id`**
    - This endpoint would retrieve a specific pizza with the given `id` from a specific restaurant with the given `id`.
3. **`POST /restaurant_pizzas`**
    - This endpoint would create a new entry in the `restaurant_pizzas` table to link a pizza with a restaurant. The request payload would include the `restaurant_id` and `pizza_id`.
4. **`DELETE /restaurant_pizzas`**
    -  This endpoint would delete an entry from the `restaurant_pizzas` table to unlink a pizza from a restaurant. The request payload would include the `restaurant_id` and `pizza_id`.

# Contributor
  - [ ![BuiltBy](https://img.shields.io/badge/Built-By-GE7A10?style=flat-square&logo=BuzzFeed&logoColor=white)](https://github.com/stephen-nene)
   **[stevo-nene](https://github.com/stephen-nene)**

# License
 - **NeneCorp** <span>&copy;</span>






