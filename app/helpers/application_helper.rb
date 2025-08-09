module ApplicationHelper
  BOOTSTRAP_VERSION       = '5.3.7'.freeze
  BOOTSTRAP_CSS_INTEGRITY = 'sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr'.freeze

  def bootstrap_stylesheet_link_tag
    stylesheet_link_tag "https://cdn.jsdelivr.net/npm/bootstrap@#{BOOTSTRAP_VERSION}/dist/css/bootstrap.min.css",
                        media:       'all',
                        integrity:   BOOTSTRAP_CSS_INTEGRITY,
                        crossorigin: 'anonymous'
  end

  def on_results_page?
    action_name != 'new'
  end
end
