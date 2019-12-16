# Rails Review

- MVC Pattern Review
- Helpers and Partials
- Nested Routes

## Rails Libraries

- ActiveRecord -> ORM
- ActiveSupport -> a bunch of useful methods like:
  - changing words from singular to plural
  - changing camel case to snake case
  - better handling of time and date
- ActiveModel
- ActionMailer -> Send emails
- ActionPack -> Router
- ActionController -> Controllers
- ActionView -> Rendering of ERB files
- ActionCable -> WebSocket - Real-Time Communication
- Gems -> extend functionality

## MVC

These libraries all follow the same pattern in Rails

[Model View Controller](./MVC_pattern.png)

A way to distribute distinct responsabilities of a web a app:

- Models -> classes provide interface to the data
- Views -> Rendering of the UI with the data
- Controllers -> respond to ressources

### Benefit

The main advantage of MVC is clear separation of concerns. We can more easily maintain our application.

### Controllers

- Controllers are getting request from the router and pulling data from the model and trigger the rendering of the view

### Models

- Provide an interface in object form between the app and the database

### Views

- The UI part of the app. Using ERB templates to render HTML.

### rails command-line

- `rails g` - Allows you to generate components for your Rails application. You can generate models, controllers, views, migrations, mailers, etc.

- `rails c` - This is your IRB console, with all of your dependencies loaded in so that you can test methods and queries from the CLI. If they don't work here, they're not going to work in your application.

- `rails s` - This starts your server. You will need to restart the server if you change logic in models, controllers, but not views.

- `rails db` - This will put you into the CLI for your database. For example, if you are using PostgreSQL, it would put you into psql.

### Rake

Rake is a task-runner utility for Rails. We can have a list of Rake commands with `Rake -T`

- `rake routes` - This command gives you the output for what routes your app is configured for.

- `rake db:reset` - Reset the database

- `rake db:migrate` - running migration.

- `rake db:version` - latest migration ran.

- `rake db:rollback` - rollback migrations.

- `rake secret` - generate a secret key

### Debugging

- debug variable in a view

`<%= debug product %>`

- place raise in your code
- byebug or pry
- console in views
- rails console
- error screen

## Rails: view and route helpers

  - Store logic you want to reuse
  - Simplify the logic in your views

### Helpers

- Helpful methods that creates reusable piece of code

- Asset helpers
- Route helpers
- Views helpers
- Custom Helpers

### Asset Helps

- stylesheet_link_tag
- javascript_include_tag

### Route helpers

- Used any of prefixes when doing `bin/rake routes`
- Add path to the prefix ex.: products_path

- This will output `/products/1`

```ruby
item = Product.first
product_path(item)
```

### Views helpers

- link_to
- button_tag
- image_tag
- form_tag
- etc.

- use the **web console** in the views (rails console in the view)
- add the web console underneath **yield** in layout

#### Link_to

`link_to "my link","http://www.mylink.com"`

- Active Record can read an object to extract the path

```ruby
item = Product.first
link_to item.name, item
```

- We can also use a route helper to create the link

```ruby
item = Product.first
link_to item.name, product_path(item)
```

- You can use a block for the `link_to`
- ex.: \_product.html.erb

- You cannot use link_to in a controller, because it will output html
- But you can use `redirect_to root_path` for example

#### image_tag

- this will output `<img src="/uploads/product/image/1/apparel1.jpg" alt="Apparel1" />`

```ruby
item = Product.first
image_tag item.image
```

#### form helpers

- utility to create your forms

```ruby
<%= form_for @quote do |form| %>
  <% if quote.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(quote.errors.count, "error") %> prohibited this quote from being saved:</h2>

      <ul>
      <% quote.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= form.label :content %>
    <%= form.text_field :content %>
  </div>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>

```

### Custom Helpers

- Take some complexity out of the view

```ruby
  module ApplicationHelper
    def user_email(user)
      if user && user.email.present?
        user.email
      else
        "no email present"
      end
    end
  end
```

```ruby
def fancy_price(product)
  if product.price > 1000
    "#{product.price}??? Hella expensive!"
  else
    "#{product.price} is kinda reasonable."
  end
end
```

## Partials

- Partials allows you to dry up your code in your views
- Reuse parts of HTML/erb content
- We can pass local variables into the partial
- Use the render method within the view
- Partials are very useful in rendering collections

- partial syntax

`<%= render partial: "partial name", locals: {some_variable: @some_variable} %>`


## Nested Resources

- Add reviews for movies




## References

- [Layouts and Rendering in Rails](https://guides.rubyonrails.org/layouts_and_rendering.html)

-[The Complete List of Ruby on Rails Helpers](https://jasoncharnes.com/rails-helpers/)
