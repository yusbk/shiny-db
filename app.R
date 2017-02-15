
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Split app files"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Tab 1", tabName = "tab1", icon = icon("hotel")),
            menuItem("Tab 3", tabName = "tab3", icon = icon("user")))),
    ## include the UI for each tab
    dashboardBody( tabItems(
        tabItem(
            tabName = "tab1",
            fluidRow(
                box(width = 6, source(file.path("ui", "tab1.R"),  local = TRUE)$value))),
        tabItem(
            tabName = "tab3",
            fluidRow(
                box(width = 12, source(file.path("ui", "tab2.R"),  local = TRUE)$value)))))
)

server <- function(input, output, session) {
    ## Include the logic (server) for each tab
    source(file.path("server", "tab1.R"),  local = TRUE)$value
    source(file.path("server", "tab2.R"),  local = TRUE)$value
}

shinyApp(ui = ui, server = server)
