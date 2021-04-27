# welfare_app

The project is built for the Ruby on Rails capstone, it's based on an app for grouping payments made by members in a certain society by months.

![screenshot](https://raw.githubusercontent.com/ybadmus/welfare_app/welfare/app_screenshot.PNG)
![screenshot](https://raw.githubusercontent.com/ybadmus/welfare_app/welfare/app_screenshot_2.PNG)
![screenshot](https://raw.githubusercontent.com/ybadmus/welfare_app/welfare/app_screenshot_3.PNG)
![screenshot](https://raw.githubusercontent.com/ybadmus/welfare_app/welfare/app_screenshot_4.PNG)
![screenshot](https://raw.githubusercontent.com/ybadmus/welfare_app/welfare/app_screenshot_5.PNG)

## Built With

- Ruby on Rails
- Using Linters for Ruby and Stylelint
- Git, GitHub
- Using Bundler

## Live Demo

 [Live demo link](https://sheltered-taiga-40435.herokuapp.com/

## Getting Started

To run this application locally, you will need to have:

- Ruby version 2.7 and above
- Rails installed
- PostgresSQL

Once you have all the above listed:

- Create a clone of this repository. 
  - In your terminal type 'git clone https://github.com/ybadmus/welfare_app.git'
  - From your terminal move into the cloned repository folder by using the 'cd' command 
- run `yarn install` 
- run `npm install`
- run `rails webpacker:install`
- run `bundle install`
- run `rails db: migrate` to migrate the database 
- run `rails server`
- Go to `http://localhost:3000` on your browser to view the homepage of the application 
- Finally run `rails console` to inspect the structure of the database and the data you stored.

### Running Tests

To run the project tests, run the following command:
```
rspec -f D
```

### Deploy on Heroku

You can deploy the project on [Heroku](https://www.heroku.com/) using the following steps:

1. Create a Heroku Account
2. On the terminal, run `heroku create` to create a new app
3. Run `heroku push` to start a deployment on Heroku.
4. Run `heroku migrate` to run migrations on your production database.
5. Visit your project URL as assigned by Heroku to see a live deployment of Fakebook.

## Authors

👤 Yusif Badmus

- GitHub: [@ybadmus](https://github.com/ybadmus) 
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/ybadmus/)
- Twitter: [@yusif_badmus](https://twitter.com/yusif_badmus)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ybadmus/welfare_app/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org)
- [Rails-Doc](https://guides.rubyonrails.org/)
- [Odin-Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-with-active-record-ruby-on-rails)
- Our standup teams

## 📝 License

<p>This project is <a href="LICENSE">MIT</a> licensed.</p>

## Enjoy!