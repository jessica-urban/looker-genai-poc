connection: "db-cummins"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
 include: "campaign.model"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
 explore: campaigns {
#    join: products {
#     type: left_outer
#     sql_on: ${campaigns.campaign_id} = ${products. campaign_id} ;;
#     relationship: many_to_one
#   }

#   join: events {
#     type: left_outer
#     sql_on: ${campaigns.campaign_id} = ${events.campaign_id} ;;
#     relationship: many_to_one
#   }

  join: customer_engagement {
    type: left_outer
    sql_on: ${campaigns.campaign_id} = ${customer_engagement.campaign_id} ;;
    relationship: one_to_many
  }

  label: "Campaigns Data Explores"
  description: "Explore campaigns data with products."

 }
