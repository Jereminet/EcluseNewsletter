### PACKAGE IMPORTS ===========================================================
library(yaml)
library(glue)
library(mailR)

send_mail <- function(subject, payload) {
    ### YAML IMPORT AND USEFUL VALUES DEFINITION ==================================
    params    <- yaml.load_file("params.yaml")
    sender    <- params$sender
    targets   <- params$recipients
    pw        <- Sys.getenv("MAIL_PWD")
    smtp      <- params$outlook_smtp
    smtp_info <- list(host.name = smtp, port = 587, user.name = sender, passwd = pw, tls = TRUE)
    
    ### SENDING EMAIL TO TARGETS ==================================================
    email <- send.mail(from = sender, to = targets, subject = subject, body = body, 
                       smtp = smtp_info, html = TRUE, authenticate = TRUE)
}

