dashboard: walmart_campaigns {
title: "Walmart Campaigns and Customer Engagement"

# Optional: description of the dashboard
description: "This is a simple demo dashboard."

# Chart tiles
add_tile: {
  title: "Campaign and Customer Engagement Overview",
  query: {
    model: "campaign.model",
    explore: "campaigns",
    fields: [
      "campaign_name",
      "total_engagements"
    ],
#    filters: {
#      "your_filter_field": "your_filter_value"
#    },
    limit: 100
  },
  visualization: {
    type: "bar"  # or "line", "table", etc.
  }
}
