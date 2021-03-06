# Application: **Luigi's Masterpiece Foods**
**A Ruby product review site. Now with user & admin authentication!**


##### By Noah Horwitz

###### _First published 2019-01-17_

## Description:
This application was made as part of a two-part coding project for Noah Horwitz, a student at _[Epicodus](http://www.epicodus.com)_, which is a vocational school for technology careers based in Portland, OR. The project is designed to add and review products in a one-to-many relationship between Products and Reviews, using comprehensive validations and callbacks. Further, user and administrator authentication has been added.

## Setup/Installation instructions:
* Click the `Clone or download` button and copy the link.
* Open your terminal application (assuming **GIT Scripts** and **node.js** (with NPM), **psql**, **Ruby 2.5.7**, and **Rails 5.2.4** have been installed on your system) and type `git clone (link)`.
* In the terminal using the `cd`... command, navigate to the newly created repository and run `bundle install`.
* In the terminal type `rake db:create`
* Then the terminal type `rake db:seed`
* Next in the terminal run `rails s`
* Finally, in a browser navigate to `localhost:3000`

## Technologies Used
 * `Ruby`
  * -v 2.5.7
 * `Rails`
  * -v 5.2.4.1
 * `SQL`
  * `psql`


## Known Bugs
* None

## User Stories
* As an admin, I should be able to log in and log out of the application.
* As an admin, I should be able to add, update and delete products.
* As an admin, I should be able to add reviews.
* As an admin, I want to ensure that other users don't have access to CRUD functionality.
* As a user, I want to be able to create an account and add a review to a product. (A product can have many comments.) This is the only CRUD functionality a user can have.

## Behavior Driven Development Specifications
|Spec|Input|Output|
|-|-|-|
|Admin should be able to **C**reate new products in the app and it will display (**R**ead) all products entered.|Fill_in name: `Product1`, cost: `1.99`, country_or_origin: `USA`, click_on `Create Product`|`Product successfully created!`|
|Admin should be able to **U**pdate existing product(s).|click_on `Product1`, click_on `Edit`, fill_in `name` `product_A`, click_on `Update Product`|` Product successfully updated!`|
|Admin should be able to **D**elete existing product(s).|... click_on `Delete Product`, click_on `yes (i'm sure)`| ` Product successfully removed!`|
||||
|User should be able to click on a created product and in the resulting view be able to **C**reate a new review for that product and it will display (**R**ead) all reviews entered.|... click_on `Product2`, fill_in `review1`, click_on `Add review` |Product Name: _Product2_, Product reviews: _review1_|
|Admin should be able to click on a created review and add in the resulting view be able to **U**pdate the review.|... click_on `review1`, fill_in `reviewA`, click_on `Update review` |Product Name: Product2, Product reviews: _reviewA_|
|Admin should be able to click on a created review and add in the resulting view be able to **D**elete the review.|... click_on `reviewA`, click_on `Delete review` |Current reviews _[none]_|
||||

## References

## Support and contact details
Contact [example@sample.com](mailto:example@sample.com)

## License
_This This repository is copyright (C) 2020 by Noah Horwitz and licensed under the GNU General Public License v3.0 [gpl-3.0](https://www.gnu.org/licenses/gpl-3.0.en.html)_.
