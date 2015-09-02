require_relative '../../api/github_link'

module Lita
  module Handlers
    class Github < Handler
      config :organization_name, type: String, required: true

      route /^compare/, command: true, help: {
        "compare REPO_NAME [production] [master]" => "Compare branches for a given repo and display link"
      } do |response|
        if response.args.length.zero?
          response.reply "We need more arguments"
        else
          response.reply GithubLink.new(config.organization_name).compare(*response.args)
        end
      end
    end

    Lita.register_handler(Github)
  end
end
