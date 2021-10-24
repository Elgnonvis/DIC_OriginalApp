# README

## Development Lnaguage

* Ruby 2.6.5
* Rails 5.2.5

Things you may want to cover:

## Employment Term Technology

* Devise
* Heroku (deploiment)
* Comment function using Ajax

## Technologies ouside the curriculum

* Cloudinary
* Simple_form

## Execution Procedure

```bash
$ git clone https://github.com/Elgnonvis/DIC_OriginalApp.git
$ cd DIC_OriginalApp
$ bundle install --path vendor/bundle
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails s
```

## Deploy to Heroku

```bash
$ heroku create Appname
$ rails assets:precompile RAILS_ENV=production
$ git add .
$ git commit -am "init"
$ heroku buildpacks:add heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs
$ heroku buildpacks:add https://github.com/heroku/heroku-buildpack-nginx
$ git push heroku master
$ heroku logs -t
```

## Catalog Design

https://docs.google.com/spreadsheets/d/1syKk-5aY49vF9kH2uyFwl3PEOxw84DTX3WKYys0xkvE/edit?usp=sharing


## Table Definition Document

https://docs.google.com/spreadsheets/d/1syKk-5aY49vF9kH2uyFwl3PEOxw84DTX3WKYys0xkvE/edit?usp=sharing

## ER Diagram

![ER Diagram](https://user-images.githubusercontent.com/78650220/137512980-176a3dc4-ff14-4d95-ac2b-f31a4afa870a.png)




https://cacoo.com/diagrams/82Q17WpL46ib93Q7/0F767


## Screen Transition Diagram

![Transition diagram](https://user-images.githubusercontent.com/78650220/137620404-2af06d58-702d-4343-91fc-98db6d5f3be4.png)



https://cacoo.com/diagrams/82Q17WpL46ib93Q7/B4CB9

## Wireframes

https://cacoo.com/diagrams/82Q17WpL46ib93Q7/701FA





bundle config set --local path 'vendor/bundle'