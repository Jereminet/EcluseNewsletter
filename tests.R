### This script is for testing purposes so meant to be deleted eventually

### PACKAGE IMPORTS ===========================================================
library(yaml)
library(googledrive)
library(googlesheets4)

### USEFUL VALUES DEFINITION AND AUTHENTICATION ===============================
params    <- yaml.load_file("params.yaml")
drive_auth(email = params$sender)
gs4_auth(params$sender)

### GETTING DRIVE CONTENT AND FILTERING BASED ON FILE NAME ====================
drive_content <- drive_ls()
responses_meta <- drive_content[drive_content$name == params$file_name, ]
base_url <- "https://docs.google.com/spreadsheets/d/"
url <- paste0(base_url, responses_meta$id)
responses <- read_sheet(url)



images_bool <- grepl(".jpeg", drive_content$name)
