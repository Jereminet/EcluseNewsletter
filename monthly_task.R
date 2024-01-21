### PACKAGE IMPORTS
library(googledrive)
library(googlesheets4)

### CUSTOM IMPORTS
source("common.R")

### USEFUL VALUES DEFINITION AND AUTHENTICATION
params    <- yaml.load_file("params.yaml")
sa_secret <- Sys.getenv("SA_SECRET")
drive_auth(path = sa_secret)
gs4_auth(params$sender)

### GETTING DRIVE CONTENT AND FILTERING BASED ON FILE NAME
drive_content <- drive_ls()
responses_meta <- drive_content[drive_content$name == params$file_name, ]
base_url <- "https://docs.google.com/spreadsheets/d/"
url <- paste0(base_url, responses_meta$id)
responses <- read_sheet(url)

#TODO: Create RData file as map

#TODO: Create Markdown template to generate HTML (based on previous step)

#TODO: Send email
#send_mail("Monthly task", TODO)

