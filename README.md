# simple-karaoke

Managed queue with ActionCable.

1. Clone repo.
1. `cd` into repo.
1. Run `bundle install`.
1. Configure your superuser name in `config/environments/development.rb`. In production, set the `SIMPLE_KARAOKE_SUPERUSER` env variable. 
1. Run `rails s`.
1. Access `localhost:3000` and enter your superuser name, then access `/admin` to see the real time queue.
1. Song requests can be sent from `localhost:3000`. No authentication required - but a cookie is persisted, so your position and name in the app will survive until the cookie is deleted or expires.
1. Access `/tv` on your main display to show who's currently up for singing.

Docker build:

`docker build -t nullset2/simple-karaoke:latest .`

See `Dockerfile` for more details.

To deploy on production, make sure you have deployed postgres on docker first, available on port `5432` on `127.0.0.1`, and create a role `simple_karaoke` with createdb privileges.

You can run the app locally simulating production:

```
docker run -it --user root \
  --network host \
  -e RAILS_MASTER_KEY=$(cat config/master.key) \
  -e SIMPLE_KARAOKE_SUPERUSER={your name} \
  -e DATABASE_URL="postgresql://simple_karaoke:itsasecrettoeverybody@127.0.0.1:5432/simple_karaoke_production" \
  -e CACHE_DATABASE_URL="postgresql://simple_karaoke:itsasecrettoeverybody@127.0.0.1:5432/simple_karaoke_production_cache" \
  -e QUEUE_DATABASE_URL="postgresql://simple_karaoke:itsasecrettoeverybody@127.0.0.1:5432/simple_karaoke_production_queue" \
  -e CABLE_DATABASE_URL="postgresql://simple_karaoke:itsasecrettoeverybody@127.0.0.1:5432/simple_karaoke_production_cable" \
  nullset2/simple-karaoke
```

Do not actually run as root in production.

See `deploy.yaml` for more details about deploying this on Kubernetes. Deploy with: ``.

Screenshots:

![](screenshots/Screenshot_20260330_150925.jpeg)
![](screenshots/Screenshot_20260330_150951.jpeg)
![](screenshots/Screenshot_20260330_151012.jpeg)
![](screenshots/Screenshot_20260330_151124.jpeg)

