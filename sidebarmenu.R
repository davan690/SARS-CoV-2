##### File: siderbarmenu.R
##### License: GPLv3 or later
##### Modification date: 05 Apr 2020
##### Written by: Adam Taiti Harth Utsunomiya
##### Contact: adamtaiti@gmail.com
##### Description: sidebar menu for COVID-19 accelerometer app

sidebarMenu(id = "sidebarmenu",
            menuItem(text = translate$text[which(translate$item == "sidebarhome" & translate$language == lang)],
                     icon = icon("info-circle"),
                     tabName = "welcome",
                     selected = TRUE),
            menuItem(text = translate$text[which(translate$item == "sidebarworldwide" & translate$language == lang)],
                     icon = icon("globe"),
                     tabName = "worldwide",
                     selected = FALSE),
            menuItem(text = translate$text[which(translate$item == "sidebarbycountry" & translate$language == lang)],
                     icon = icon("flag"),
                     tabName = "country",
                     selected = FALSE),
            conditionalPanel(condition = "input.sidebarmenu === 'country'",
                             selectInput(inputId = "selcountry",
                                         label = translate$text[which(translate$item == "selectcountry" & translate$language == lang)],
                                         choices = getcountries(realdata),
                                         selected = "Australia"),
                             sliderInput(inputId = "smoothrange",
                                         label = translate$text[which(translate$item == "smoothfactor" & translate$language == lang)],
                                         min = 3, max = 7, step = 1, value = 5),
                             sliderInput(inputId = "hmmrange", label = translate$text[which(translate$item == "hmmclassifier" & translate$language == lang)],
                                         min = 1, max = 10, step = 1, value = 5)
            ),
            menuItem(text = translate$text[which(translate$item == "sidebarlocal" & translate$language == lang)],
                     icon = icon("map-marked-alt"),
                     tabName = "local",
                     selected = FALSE),
            conditionalPanel(condition = "input.sidebarmenu === 'local'",
                             fileInput(inputId = "loadfile",
                                       label = NULL,
                                       buttonLabel = "Upload",
                                       accept = c("xlsx", "xls"),
                                       multiple = F,
                                       width = "100%"),
                             sliderInput(inputId = "smoothrangel",
                                         label = translate$text[which(translate$item == "smoothfactor" & translate$language == lang)],
                                         min = 3, max = 7, step = 1, value = 5),
                             sliderInput(inputId = "hmmrangel",
                                         label = translate$text[which(translate$item == "hmmclassifier" & translate$language == lang)],
                                         min = 1, max = 10, step = 1, value = 5)
            ),
            menuItem(text = translate$text[which(translate$item == "sidebardownload" & translate$language == lang)],
                     icon = icon("download"),
                     tabName = "download",
                     selected = FALSE),
            menuItem(text = translate$text[which(translate$item == "sidebarhelp" & translate$language == lang)],
                     icon = icon("question-circle"),
                     tabName = "help",
                     selected = FALSE),
            menuItem(text = translate$text[which(translate$item == "sidebarsource" & translate$language == lang)], icon = icon("github"),
                     selected = FALSE, href = "https://github.com/adamtaiti/SARS-CoV-2")
)
