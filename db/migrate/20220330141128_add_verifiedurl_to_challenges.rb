class AddVerifiedurlToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :verified_url, :string
  end
end
