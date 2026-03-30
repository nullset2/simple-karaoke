# simple-karaoke

Managed queue with ActionCable.

1. Clone repo.
1. `cd` into repo.
1. Run `bundle install`.
1. Configure your superuser name in `config/environments/development.rb` or `production.rb`. Do not reveal this in production.
1. Run `rails s`.
1. Access `localhost:3000` and enter your superuser name, then access `/admin` to see the real time queue.
1. Song requests can be sent from `localhost:3000`. No authentication required - but a cookie is persisted, so your position and name in the app will survive until the cookie is deleted or expires.
1. Access `/tv` and display that in your main display to show who's currently up for singing.

