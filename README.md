# Profiteer based on Kirill's fork from Shopify App 

The sample app includes:
- JWT integration for [Hotwire Turbo](https://turbo.hotwired.dev/)
- JWT integration for [Rails Request.JS](https://github.com/rails/request.js)
- App Bridge 2.0
- [Polaris ViewComponents](https://github.com/baoagency/polaris_view_components)
- [Hotwire::Livereload](https://github.com/kirillplatonov/hotwire-livereload)

Since the `shopify_app` gem is not fully compatible with App Bridge 2 this sample uses fork.

## Quick start

To run this app locally, you can clone this repository and do the following.

1. Connect to Shopify:

```
shopify app connect
```

It will generate `.env` file with Shopify API credentials.

2. Setup Rails app:
```
bin/setup
```

3. Run `ngrok` on port 3000:
```
ngrok http 3000
```

4. Start the app:
```
bin/dev
```

5. Install and open this app on a development shop.
