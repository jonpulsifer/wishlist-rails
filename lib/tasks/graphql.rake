# typed: true
# frozen_string_literal: true

require 'graphql/rake_task'

namespace :graphql do
  namespace :schema do
    desc "Dump the GraphQL Schema"
    task dump: :environment do
      schema_path = Rails.root.join("app", "graphql", "schema.graphql")
      schema_path.write(WishlistAppSchema.to_definition)

      puts "Updated GraphQL schema dump: #{schema_path}"
    end
  end
end
