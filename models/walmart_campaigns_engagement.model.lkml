# Define the database connection to be used for this model.
connection: "db-cummins"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: walmart_campaigns_engagement_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: walmart_campaigns_engagement_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Walmart Campaigns Engagement"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: customer_engagement {}

explore: campaigns {
  join: customer_engagement {
    sql_on: ${campaigns.campaign_id} = ${customer_engagement.campaign_id} ;;  # Define the join condition
    type: left_outer  # Can be 'inner', 'left', 'right', or 'full'
    relationship: one_to_many  # Define relationship type
  }
}
