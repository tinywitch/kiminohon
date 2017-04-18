# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
# add app/assets/fonts to the asset path
Rails.application.config.assets.paths("app", "assets", "fonts")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( front_end.css )
Rails.application.config.assets.precompile += %w( back_end.css )
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( back_end.js )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )

# Datatables
Rails.application.config.assets.precompile += %w( dataTables.bootstrap.min.css )
Rails.application.config.assets.precompile += %w( dataTables.bootstrap.min.js )
Rails.application.config.assets.precompile += %w( jquery.dataTables.min.js )

# Nprogress
Rails.application.config.assets.precompile += %w( nprogress.css )
Rails.application.config.assets.precompile += %w( nprogress.js )

# Form validation
Rails.application.config.assets.precompile += %w( parsley.min.js )

# Select2
Rails.application.config.assets.precompile += %w( select2.min.css )
Rails.application.config.assets.precompile += %w( select2.min.js )

# Masonry Grid
Rails.application.config.assets.precompile += %w( masonry.pkgd.min.js )
Rails.application.config.assets.precompile += %w( imagesloaded.pkgd.min.js )

# PNotify
Rails.application.config.assets.precompile += %w( pnotify.css )
Rails.application.config.assets.precompile += %w( pnotify.js )
Rails.application.config.assets.precompile += %w( pnotify.buttons.css )
Rails.application.config.assets.precompile += %w( pnotify.buttons.js )

# Morris Chart
Rails.application.config.assets.precompile += %w( raphael.min.js )
Rails.application.config.assets.precompile += %w( morris.min.js )

# Daterangepicker
Rails.application.config.assets.precompile += %w( moment.min.js )
Rails.application.config.assets.precompile += %w( daterangepicker.js )

# Icheck
Rails.application.config.assets.precompile += %w( icheck.min.js )
Rails.application.config.assets.precompile += %w( green.css )