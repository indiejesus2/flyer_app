# Flyer-App

## Summary

Flyer, a basic Rails application that offers bands the ability to keep track of their upcoming concerts. Much like flyers handed out at concerts, Flyer shows upcoming shows with general info such as price of  admission and parking.

A user can signup their band with a username, password and email. The user must use a unique username and can't register a band already in the database. Flyer also offers users the ability to signup and login through their Google account.

After a user establishes their information, they are redirected to the band edit page to input the band's city and state, and genre if they choose. Then the user will be allowed to generate concerts with the necessary details including date and venue. A concert's venue can be chosen from a selection of venues already created, or a venue can be created in the concert's form.

The concerts index includes search options to filter by band, venue or date. The search feature is capable of handling multiple search parameters. The index page is able to display all concerts, one band's concerts or concerts based on the search options.

## Install

In order to run application successfully, first run bundle install for the necessarty gems to be installed. This includes bcrypt to hide users passwords, the Google omni-auth for Google login, and dotenv for Rails to prevent Google client_ids and secrets from posting on GitHub. 

Next, for the Google omni-auth gem to property work, a Google API must be setup. This will provide the necessary Google client_ids and secret to establish connection between the app and Google. Then a .env file should be created in the root where the Google information will be stored.

## Contributing

Pull requests are encouraged on [GitHub](https://github.com/indiejesus2/flyerapp) as well as any bug reports. This project is intended to be a safe, welcoming space for colloration, and contributors are expected to adhere to the Contributor Covenant Code of Conduct.

## License

This gem is an open source under the terms of the [MIT License](https://github.com/indiejesus2/FlyerApp/blob/master/LICENSE).