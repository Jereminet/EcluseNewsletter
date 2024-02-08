### PACKAGE IMPORTS
library(dplyr)
library(janitor)
library(googledrive)
library(googlesheets4)

### CUSTOM IMPORTS
source("common.R")

### USEFUL VALUES DEFINITION AND AUTHENTICATION
params    <- yaml.load_file("params.yaml")
sa_secret <- Sys.getenv("SA_SECRET")
# drive_auth(path = sa_secret)
drive_auth(email = params$sender)
gs4_auth(params$sender)

### GETTING DRIVE CONTENT AND FILTERING BASED ON FILE NAME
drive_content <- drive_ls()
responses_meta <- drive_content[drive_content$name == params$file_name, ]
base_url <- "https://docs.google.com/spreadsheets/d/"
url <- paste0(base_url, responses_meta$id)
responses <- read_sheet(url) %>% 
    clean_names()

### GETTING SET OF PEOPLE WHO ANSWERED
res_list <- list()
respondants <- unique(responses$email_address)
for (respondant in respondants){
    tmp_data <- filter(responses, email_address == respondant)
    res_list[[respondant]][["text"]] <- tmp_data
    # res_list[[respondant]][["images"]] <-     #TODO: find a way to get the images and download them 
    
}

#TODO: Create RData file as map

#TODO: Create Markdown template to generate HTML (based on previous step)

#TODO: Send email
#send_mail("Monthly task", TODO)

