library(httr)
library(httpuv)
library(tidyjson)

# Register Oauth Application
# Github -> Developer Settings -> OAuth Apps -> New
# Homepage URL <- http://github.com
# Authorization callback URL <- http://localhost:1410 (1410 is httr default port)

application_name <- 'TBCoursera'
client_id <- 'cb9ad898bf74b7962853'
client_secret <- '6a9230bbdc736d533cbc0124b0e303050de71f1f'

#Create github app and token
my_github_app <- oauth_app(appname = application_name, 
                           key = client_id, 
                           secret = client_secret)
github_token <- config(token = oauth2.0_token(oauth_endpoints('github'), my_github_app))

#Send request to jtleek's repo using github API
request <- GET("https://api.github.com/users/jtleek/repos", github_token)

#Check for http errors
stop_for_status(request)

# Retrieve contents of page
# JSON is a common output format used by APIs, and is indeed the case here
api_data = content(request)

#Convert data to tbl_json
data_tibble <- spread_all(api_data)

#Find datasharing repo and access created_at attribute
date_created <- data_tibble[data_tibble$full_name == "jtleek/datasharing",'created_at']$created_at

print(date_created)
