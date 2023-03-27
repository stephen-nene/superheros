# Heroes Project

## Description
  #### live link = [Superheroes](https://github.com/stephen-nene/superheros/fork)

- The Heroes API is designed to manage a database of different `superheroes` and their respective `powers`. The application has three main resources - `Hero`, `Power`, and `HeroPower`. The `Hero` model represents a `superhero` that possesses one or more `powers`, while the `Power` model represents the different types of `powers` that a `superhero` can have. The `HeroPower` model acts as a join table between the `Hero` and `Power` models, allowing for the association between the two.

- This API will allow users to perform various **CRUD** operations such as **adding** new `heroes` and `powers`, **updating** and **deleting** existing `heroes` and `powers`, and **retrieving** information on specific `heroes` and `powers`. **_Users_** can also associate specific `powers` with a `hero` by creating a new `HeroPower` entry. However, this API is not intended to handle any advanced features such as user authentication or authorization, which may be required for a full-fledged superhero management platform.

# Technologies used

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white) ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) ![Git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

![Markdown](https://img.shields.io/badge/markdown-%23000000.svg?style=for-the-badge&logo=markdown&logoColor=white) ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) ![SQLite](https://img.shields.io/badge/sqlite3-%2307405e.svg?style=for-the-badge&logo=sqlite&logoColor=white)

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) ![json](https://img.shields.io/badge/json-5E5C5C?style=for-the-badge&logo=json&logoColor=white)

![Stack Overflow](https://img.shields.io/badge/-Stackoverflow-FE7A16?style=for-the-badge&logo=stack-overflow&logoColor=white)

# Get-started
1. A)First **fork** this repository to your github account.

     [Click-Here-To-Fork](https://github.com/stephen-nene/superheros/fork)

2. **Git clone** to your local machine
   ```bash
       git clone https://github.com/{your-username}/superheros.git
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

| Heroes      | powers      | HeroPower         |
| ----------- | ----------- | ----------------- |
| id (**pk**) | id (**pk**) | id (**pk**)       |
| name        | name        | hero_id (**FK**)  |
| super_name  | description | power_id (**FK**) |

-This diagram shows the relationships between the `Heroes`, `Powers`, and `HeroPowers` tables. The `Heroes` table has a **many-to-many** relationship with the `Powers` table, as each hero can have multiple `powers`, and each `power` can belong to multiple `heroes`. The `HeroPowers` table acts as a bridge table between `Heroes` and `Powers`, allowing for the **many-to-many** relationship between them.

# Routes

### A. <u>pizza</u>

- These are HTTP methods used for interacting with a hypothetical API that deals with pizza-related data. Here's a breakdown of each one:

1. **GET /heroes**
  - Returns a list of all `heroes` in **JSON** format with their id, name and superhero name. The format of the **JSON** response is.

    ```json
    [
      {
        "id": 1,
        "name": "Kamala Khan",
        "super_name": "Ms. Marvel"
        },
      {
        "id": 2,
        "name": "Doreen Green",
        "super_name": "Squirrel Girl"
        },
      {
        "id": 3,
        "name": "Gwen Stacy",
        "super_name": "Spider-Gwen"
        }
    ]
    ```

2. **GET /heroes/:id**

   - This route should return information about a specific `hero`. If the `hero` with the given ID exists, it should return **JSON** data in the following format:

    ```json
    {
      "id": 1,
      "name": "Kamala Khan",
      "super_name": "Ms. Marvel",
      "powers": [
        {
          "id": 1,
          "name": "super strength",
          "description": "gives the wielder super-human strengths"
        },
        {
          "id": 2,
          "name": "flight",
          "description": "gives the wielder the ability to fly through the skies at supersonic speed"
        }
      ]
    }
    ```

   - If the `hero` does not exist, the route should return the following **JSON** data along with an appropriate **HTTP** status code:

   ```json
   {
     "error": "Hero not found"
   }
   ```

3. **GET /powers**

   - This route should return an array of all `powers` in the following **JSON** format.
    ```json
             [
                {    "id": 1,
                      "name": "super strength",
                      "description": "gives the wielder super-human strengths"
                },
                {
                     "id": 2,
                     "name": "flight",
                     "description": "gives the wielder the ability to fly through the skies at supersonic speed"
                }
             ]
    ```
4. **GET /powers/:id**
  -  If the power with the specified id exists, returns the details of the power in JSON format with their id, name and description. The format of the JSON response is
        ```json
             {
                "id": 1,
                "name": "super strength",
                "description": "gives the wielder super-human strengths"
             }
        ```
  - If the power with the specified id does not exist, returns a JSON response with an error message and the appropriate HTTP status code:
    ```json
            {
                 "error": "Power not found"
            }
    ```
5. **PATCH /powers/:id**
  - Updates the description of the power with the specified id. Accepts a JSON object in the request body with the updated description in the "description" field. The format of the JSON response depends on the success of the update operation:
      -If the power with the specified id exists and is updated successfully (passes validations), returns the updated details of the power in JSON format with their id, name and updated description. The format of the JSON response is:
      ```json
          {
              "name": "super strength update",
              "description":"updated description"
          }
       ```
  - If the power with the specified id does not exist, returns a JSON response with an error message and the appropriate HTTP status code:
      ```json
           {
             "error":"power not found"
           }
      ```
  - If the power with the specified id is not updated successfully (does not passvalidations), returns a JSON response with an error message and the appropriate HTTP status code:
      ```json
            {
                "errors":["Validation errors"]
            }
      ```
6. **POST /hero_powers**
  - Creates a new HeroPower association between an existing power and hero. Accepts a JSON object in the request body with the following properties:
      ```json
            {
                "strength":"medium",
                "power_id":"1",
                "hero_id":"2"
            }
      ```
  - If the HeroPower is created successfully, returns a JSON response with the details of the hero in the format specified below :
      ```json
            {
               "id": 1,
               "name": "Kamala Khan",
               "super_name": "Ms. Marvel",
               "powers": [
                   {
                   "id": 1,
                   "name": "super strength",
                   "description": "gives the wielder super-human strengths"
                   },
                   {
                   "id": 2,
                   "name": "flight",
                   "description": "gives the wielder the ability to fly through the skies at supersonic speed"
                   }
               ]
            }
      ```
  - If the `HeroPower` is **not** created successfully, return the following JSON data, along with the appropriate HTTP status code:
    ```json
       "errors": ["validation errors"]
    ```


7. **DELETE /powers/:id`**
   - This **DELETE** route is used to delete a specific power from the database based on its ID. If the power with the given ID exists, it will be deleted and a 204 No Content status code will be returned.

   - If the power does not exist, the route should return the following JSON data along with an appropriate HTTP status code
    ```json
           {
           "error": "Power not found"
           }
    ```




# Contributor

- [ ![BuiltBy](https://img.shields.io/badge/Built-By-GE7A10?style=flat-square&logo=BuzzFeed&logoColor=white)](https://github.com/stephen-nene)
  **[stevo-nene](https://github.com/stephen-nene)**

# License

- **NeneCorp** <span>&copy;</span>
