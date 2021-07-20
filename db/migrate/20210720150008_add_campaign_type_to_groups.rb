class AddCampaignTypeToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :campaign_type, :text
  end
end
