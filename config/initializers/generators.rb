Rails.application.config.generators do |g|
  g.orm             :active_record
  g.template_engine :erb
  g.test_framework  :rspec, fixture: false
  g.stylesheets     false
  g.javascripts     false
end
